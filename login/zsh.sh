#!/bin/bash

USERNAME=$1
mkdir -p /mnt/etc/systemd/system/getty@tty1.service.d
touch /mnt/etc/systemd/system/getty@tty1.service.d/autologin.conf

cat <<EOF> /mnt/etc/systemd/system/getty@tty1.service.d/autologin.conf
[Service]
Type=simple
ExecStart=
ExecStart=/sbin/agetty --autologin $USERNAME --noclear %I 38400 linux
EOF

arch-chroot /mnt systemctl enable getty@tty1.service.d





