#!/bin/sh

# V2Ray new configuration
cat <<-EOF > /etc/v2ray/config.json
{
  "inbounds": [
  {
    "port": ${PORT},
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "${UUID}",
          "alterId": "${ALTER_ID}"
        }
      ]
    },
    "streamSettings": {
      "network": "ws",
      "wsSettings": {
        "path": "${V2_PATH}"
      }
    }
  }
  ],
  "outbounds": [
  {
    "protocol": "freedom",
    "settings": {}
  }
  ]
}
EOF
# start tor and v2ray
nohup tor &
/usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json
