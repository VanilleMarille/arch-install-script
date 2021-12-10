#!/bin/bash


#Preparing/Partitioning drive for Arch Linux installation
./partition.sh /dev/vda


#Configuring Pacman
echo "Server = http://192.168.1.202/arch/mirror/files/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
pacman-key --init
pacman-key --populate archlinux
pacman -Sy

pacstrap /mnt base base-devel linux linux-firmware lvm2 vim

genfstab -p /mnt >> /mnt/etc/fstab


./boot.sh
./locale.sh
./host.sh
./user.sh


arch-chroot /mnt passwd
