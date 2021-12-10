#!/bin/bash

HOSTNAME="arch-vm"

echo $HOSTNAME > /etc/hostname

cat <<EOF> /mnt/etc/hosts
127.0.0.1 	localhost
:: 		localhost
127.0.1.1 	$HOSTNAME
EOF

