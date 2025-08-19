#!/usr/bin/env bash

SERVER_CONFIG_PATH=/usr/local/etc/xray/config.json
CLIENT_DESCRIPTIONS=xray-clients.txt
TEMPLATE=~/Xray/config-template.jq
ENV_FILE=~/Xray/env
OUT_DIR=~/Xray/gen

[[ ! -f "$ENV_FILE" ]] && "Env file not found" && exit 1
# shellcheck source=env
source "$ENV_FILE"

[[ ! -d "$OUT_DIR" ]] && mkdir "$OUT_DIR"

[[ -z "$1" ]] && echo "Provide a description of a client." && exit 1
description="$1"

uuid="$(uuidgen)"
short_id="$(openssl rand -hex 8)"

conf="$(mktemp "xray-configXXXXX.json")"
scp "$SERVER_HOST:$SERVER_CONFIG_PATH" "$conf"
jq \
    --arg id "$uuid" \
    --arg short_id "$short_id" \
    '.inbounds[0] |= (
    .settings.clients += [{$id, flow: "xtls-rprx-vision"}] |
    .streamSettings.realitySettings.shortIds += [$short_id]
)' "$conf" | ssh "$SERVER_HOST" dd of=$SERVER_CONFIG_PATH
rm "$conf"
printf '%s[%s]: %s\n' "$uuid" "$short_id" "$description" \
    | ssh "$SERVER_HOST" dd oflag=append conv=notrunc of="$CLIENT_DESCRIPTIONS"

jq -n -f "$TEMPLATE" \
    --arg id "$uuid" \
    --arg shortId "$short_id" \
    --arg address "$SERVER_ADDRESS" \
    --arg publicKey "$PUBLIC_KEY" \
    > "$OUT_DIR/config-$(date '+%Y-%m-%d')[$description].json"

