#!/bin/sh
set -x
set -e

CRYPTED_DEV="/dev/mapper/storage"
MOUNTPOINT="/mnt-root"

echo "Starting @home reset"
mkdir -p "$MOUNTPOINT"
mount -t btrfs -o subvolid=5 "$CRYPTED_DEV" "$MOUNTPOINT"

if [ ! -d "$MOUNTPOINT/@snapshots" ]; then
    btrfs subvolume create "$MOUNTPOINT/@snapshots"
fi
mkdir -p "$MOUNTPOINT/@snapshots/home"

if [ -e "$MOUNTPOINT/@home" ]; then
    TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")
    echo "moving old @home to @snapshots/home/$TIMESTAMP"

    mv "$MOUNTPOINT/@home" "$MOUNTPOINT/@snapshots/home/$TIMESTAMP"
    btrfs property set "$MOUNTPOINT/@snapshots/home/$TIMESTAMP" ro true
fi

echo "create empty @home"
btrfs subvolume create "$MOUNTPOINT/@home"
umount "$MOUNTPOINT"
echo "@home reset ended"