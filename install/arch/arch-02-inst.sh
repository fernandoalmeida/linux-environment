#/bin/bash -e

###############################################
# post-installation
###############################################
echo "setup timezone"
read
ln -sf /usr/share/zoneinfo/America/Bahia /etc/localtime

echo "setup clock"
read
hwclock --systohc

echo "setup locale"
read
sed -i 's/\#pt_BR/pt_BR/g' /etc/locale.gen
sed -i 's/\#en_US/en_US/g' /etc/locale.gen
locale-gen
locale > /etc/locale.conf

echo "setup keyboard"
read
echo "KEYMAP=br-abnt2" > /etc/vconsole.conf

echo "setup hostname"
read
echo "fernando-arch" > /etc/hostname

echo "setup localhost"
read
cat <<CONTENT > /etc/hosts
127.0.0.1 localhost
::1       localhost
127.0.1.1 fernando-arch
CONTENT

echo "setup boot"
read
sed -ri 's/^(HOOKS.*) filesystems/\1 lvm2 filesystems/g' /etc/mkinitcpio.conf
mkinitcpio -p linux

echo "setup systemd boot"
read
bootctl --path=/boot/ install
cat <<EOF > /boot/loader/loader.conf
default arch
timeout 1
editor 0
EOF

cat <<EOF > /boot/loader/entries/arch.conf
title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img
options root=/dev/main/system quiet rw
EOF

echo "setup root password"
read
passwd

echo "setup user"
read
useradd -m -g users -G wheel fernando
passwd fernando

echo "setup sudo"
read
sed -ri 's/\# (%wheel ALL=\(ALL\) ALL)/\1/g'

# exit
# umount -R /mnt
# reboot
