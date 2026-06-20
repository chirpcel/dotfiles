#!/usr/bin/env bash

cryptsetup erase -v --hw-opal-factory-reset /dev/nvme0n1
disko-install --mode destroy,format,mount --write-efi-boot-entries --flake .#panta --disk main /dev/nvme0n1