#!/bin/bash
export PW=$(cat /data/home/aries-terminal/.htpass)
exec /usr/local/bin/ttyd --port 7681 --interface 127.0.0.1 --credential "user:$PW" --max-clients 5 --ping-interval 15 --terminal-type xterm-256color bash --login
