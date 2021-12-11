#!/bin/bash

USERNAME=username

arch-chroot /mnt pacman -S openbox ttf-dejavu ttf-liberation xterm xorg-xrandr

touch /mnt/opt/xrandr.sh
cat <<EOF> /mnt/opt/xrandr.sh
#!/bin/bash

xrandr --size 1920x1080

EOF

chmod +x /mnt/opt/xrandr.sh


sed '/^[Seat:*]/a display-setup-script=/opt/xrandr.sh/g' /etc/lightdm/lightdm.conf

sed '/^[Seat:*]/a session-setup-script=/opt/xrandr.sh/g' /etc/lightdm/lightdm.conf



