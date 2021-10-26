#!/bin/bash

set -e

PROTECT_DIR=/srv/unifi-protect/backups
NETWORK_DIR=/srv/unifi/data/backup/autobackup

if [ -d "$PROTECT_DIR" ]; then
  echo "--> syncing the unifi protect backups"
  rsync -av --delete /srv/unifi-protect/backups /sdcard/backups/protect
fi

if [ -d "$NETWORK_DIR" ]; then
  echo "--> syncing the unifi network backups"
  rsync -av --delete /srv/unifi/data/backup/autobackup /sdcard/backups/network
fi
