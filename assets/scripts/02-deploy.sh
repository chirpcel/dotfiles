#!/usr/bin/env bash
cryptsetup erase -v --hw-opal-factory-reset /dev/nvme0n1
disko-install --mode format --write-efi-boot-entries --flake .#graphite --disk main /dev/nvme0n1