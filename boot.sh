sed 's/HOOKS=.*/HOOKS=\"systemd autodetect modconf block lvm2 filesystems keyboard fsck\"/' /mnt/etc/mkinitcpio.conf

arch-chroot /mnt mkinitcpio -p linux
arch-chroot /mnt bootctl --path=/boot/ install


touch /mnt/boot/loader/loader.conf
cat <<EOF> /mnt/boot/loader/loader.conf 
default arch
timeout 0
editor no
EOF


UUID=$(arch-chroot /mnt blkid -o value -s UUID /dev/system_vg/rootfs)

touch /mnt/boot/loader/entries/arch.conf
cat <<EOF> /mnt/boot/loader/entries/arch.conf
title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img
options root="UUID=$UUID" rw quiet loglevel=3 rd.systemd.show_status=auto rd.udev.log_level=3
EOF

