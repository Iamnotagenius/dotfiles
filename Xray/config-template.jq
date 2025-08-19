{
  "log": {
    "loglevel": "info"
  },
  "routing": {
    "rules": [
      {
        "type": "field",
        "domain": [
            "rutracker",
            "x.com",
            "geosite:youtube",
            "geosite:discord",
            "geosite:openai"
        ],
        "outboundTag": "proxy"
      }
    ]
  },
  "inbounds": [
    {
      "listen": "127.0.0.1",
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "udp": true
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom",
      "tag": "direct"
    },
    {
      "protocol": "vless",
      "settings": {
        "vnext": [
          {
            $address,
            "port": 443,
            "users": [
              {
                $id,
                "encryption": "none",
                "flow": "xtls-rprx-vision"
              }
            ]
          }
        ]
      },
      "streamSettings": {
        "network": "tcp",
        "security": "reality",
        "realitySettings": {
          "show": false,
          "fingerprint": "chrome",
          "serverName": "google.com",
          $publicKey,
          $shortId
        }
      },
      "tag": "proxy"
    }
  ]
}
