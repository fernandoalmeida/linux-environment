#/bin/bash -euxo pipefail

###############################################
# pre-installation
###############################################
echo "setup keyboard"
read
loadkeys br-abnt2

echo "connect wifi"
read
iwctl station wlan0 connect orochi-5g

echo "update package databases"
read
pacman -Syyy

echo "setup clock"
read
timedatectl set-ntp true

echo "setup disk partitioning (LVM)"
echo "create partitions"
read
cat <<COMMANDS | fdisk /dev/sdb
g
n
1

+500M
t
1
n
2


t
2
30
w
COMMANDS
fdisk -l /dev/sdb

echo "format boot partition"
read
mkfs.fat -F 32 /dev/sdb1

echo "setup LVM"
read
pvcreate -ff /dev/sdb2
vgcreate -ff main /dev/sdb2
lvcreate -L 110GB -n system main
lvcreate -l 100%free -n swap main
modprobe dm_mod
vgscan
vgchange -ay

echo "format LVM partitions"
read
mkfs.ext4 /dev/main/system
mount /dev/main/system /mnt
mkdir /mnt/boot
mount /dev/sdb1 /mnt/boot

mkswap /dev/main/swap
swapon /dev/main/swap

###############################################
# installation
###############################################
echo "install base system"
read
pacstrap /mnt base base-devel linux linux-firmware lvm2 vim make man

echo "setup fstab"
read
genfstab -U /mnt >> /mnt/etc/fstab
cat <<EOF >> /mnt/etc/fstab

/dev/sda1           	/mnt/hd   	ext4      	rw,relatime	0 2
EOF

echo "copy post-installation scripts"
read
cp ./arch-*.sh /mnt

echo "chroot new system"
read
arch-chroot /mnt
