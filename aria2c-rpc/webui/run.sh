#!/bin/sh


if [[ -n $RPC_URL ]]; then
  sed -i "s@server_name.*;@location = /jsonrpc { proxy_pass $RPC_URL; }@" /etc/nginx/conf.d/default.conf
fi

nginx -g 'daemon off;'
