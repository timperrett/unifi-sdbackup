# Unifi Cloud Key SD Card Backup

This repo provides a rudimentary systemd unit pair that rysncs the backups that are on the cloud key disk, to the built-in SD card slot. I've done this because the cloud key seems to get screwed up more often than I really care to debug, and there are countless threads on this online (my most recent one was from a power outage, despite doing a graceful shutdown on UPS). Subsequently, lets make it very easy to recover.

FWIW, the new cloud backup for Unifi OS is miles better than the status quo, but as it doesn't yet handle unifi protect, this is a belt and braces that avoids having to reset the actual camera devices (which is a total pain in the butt).

## Install Steps

1. Power down the Cloud Key
1. Insert an SD card into the slot on the rear of the device
1. Boot the cloud key and validate the SD card is recognized (either in the dashboard or via SSH where it will be under the path `/sdcard`)
1. Enable auto-backups in the Cloud Key console on whatever schedule makes sense for you.
1. Copy over `sdbackup.sh` to `/usr/local/bin/sdbackup.sh`
1. Copy over `sdbackup.service` to `/etc/systemd/system`
1. Copy over `sdbackup.timer` to `/etc/systemd/system`
1. Enable the units: `systemctl enable sdbackup.service && systemctl enable sdbackup.timer`
1. Profit!

