#!/bin/bash

USERNAME=username

arch-chroot /mnt pacman -S openbox ttf-dejavu ttf-liberation xterm xorg-xrandr

touch /mnt/opt/xrandr.sh
cat <<EOF> /mnt/opt/xrandr.sh
#!/bin/bash

xrandr --size 1920x1080

EOF

chmod +x /mnt/opt/xrandr.sh


SeatLine=$(grep -n "\\[Seat:\*\\]$" /mnt/etc/lightdm/lightdm.conf | cut -f1 -d:)

sudo sed -i "${SeatLine} -i session-setup-script=/opt/xrandr.sh" /mnt/etc/lightdm/lightdm.conf

sudo sed -i "${SeatLine} -i display-setup-script=/opt/xrandr.sh" /mnt/etc/lightdm/lightdm.conf


