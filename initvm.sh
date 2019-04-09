#!/bin/sh
bash prepare_vm_disks.sh
apt update && apt upgrade --yes
if [ -f /var/run/reboot-required ]; then
  reboot
fi
