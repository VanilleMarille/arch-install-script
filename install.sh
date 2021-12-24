#!/bin/bash

USERNAME=user
DESK_ENVIRONMENT=lxde
AUTOLOGIN=true

#Preparing/Partitioning drive for Arch Linux installation
./partition.sh /dev/vda


#Configuring Pacman
echo "Server = http://192.168.1.202/arch/mirror/files/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
pacman-key --init
pacman-key --populate archlinux
pacman -Sy

pacstrap /mnt base base-devel linux linux-firmware lvm2 vim dhcpcd

genfstab -p /mnt >> /mnt/etc/fstab


./scripts/boot.sh
./scripts/locale.sh
./scripts/host.sh
./scripts/user.sh $USERNAME
./scripts/login/lightdm.sh $USERNAME $AUTOLOGIN
./scripts/xorg.sh
./scripts/environment/$DESK_ENVIRONMENT.sh $USERNAME
./scripts/additional.sh

arch-chroot /mnt systemctl enable dhcpcd

