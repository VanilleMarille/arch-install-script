echo "g
n
1

+300M
n
2

+4G
n
3


t
1
1
t
2
19
t
3
30
w
" | fdisk $1 

mkfs.fat -F32 "$1"1
mkswap "$1"2

pvcreate "$1"3

vgcreate system_vg "$1"3

lvcreate -l 100%FREE system_vg -n rootfs

mkfs.ext4 /dev/system_vg/rootfs

mount /dev/system_vg/rootfs /mnt
mkdir /mnt/boot
mount "$1"1 /mnt/boot
swapon "$1"2
