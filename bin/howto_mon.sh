#!/usr/bin/env bash
#
# howto_mon.sh
# Copyright (C) 2016 janck <janck76@gmail.com>
#
# Distributed under terms of the MIT license.
#

#set -o errexit
set -o nounset

WAIT_SEC=600 #sec
NOTIFY_TIMEOUT=60000 #ms

cd $HOME/howto

while [[ true ]]; do
  git fetch origin
  status=$(git status --porcelain --branch|egrep -v '## master...origin/master$')
  if [[ ! -z $status ]]; then
    notify-send -u normal -t $NOTIFY_TIMEOUT 'howto repo needs updating' "$status"
  fi
  sleep $WAIT_SEC
done
