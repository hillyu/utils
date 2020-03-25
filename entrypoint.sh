#!/bin/sh
s="${SERVER:-hill@hills.ml}"
p=${PORT:-2003}
h=${HOST_ID:-99}
autossh -M0 -NR 100${h:(-2)}:`ip route|grep default|cut -d' ' -f3`:22  "$s" -p $p -o \
        "ServerAliveInterval 60" -o  "ServerAliveCountMax 3"
sh

exec "$@"
