#!/bin/sh

echo '{"command": ["cycle", "pause"]}' | socat - $WALLPAPER_SOCKET
