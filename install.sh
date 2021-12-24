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


./boot.sh
./locale.sh
./host.sh
./user.sh $USERNAME
./login/lightdm.sh $USERNAME $AUTOLOGIN
./xorg.sh
./environment/$DESK_ENVIRONMENT.sh $USERNAME

arch-chroot /mnt systemctl enable dhcpcd

