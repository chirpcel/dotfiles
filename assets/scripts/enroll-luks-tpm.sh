#!/usr/bin/env bash
sudo systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=1,7 /dev/nvme0n1p2