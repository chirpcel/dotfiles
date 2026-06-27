#!/usr/bin/env bash
mkdir /home/nixos/nixos
cp -r /etc/nixos/* /home/nixos/nixos
chmod -R 770 /home/nixos/nixos
cd /home/nixos/nixos
echo "TODO: Clear age host key"
echo "TODO: Disable lanzaboot, activate default systemd-boot"
echo "TODO: Then deploy.sh"