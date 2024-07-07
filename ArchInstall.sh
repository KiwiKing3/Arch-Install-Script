#!/bin/bash
#Kiwi King's Arch Install script

#Pre-Installation

loadkeys de-latin1
#partitioning must be added
mkfs.fat -F 32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3
mount /dev/sda3 /mnt
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
swapon /dev/sda2

#Installation

pacstrap /mnt base linux linux-firmware sof-firmware base-devel grub efibootmgr nano networkmanager git neofetch plasma sddm
genfstab /mnt > /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
