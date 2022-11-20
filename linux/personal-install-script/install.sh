sudo timedatectl set-ntp true
sudo mount /dev/nvme0n1p2 /mnt
sudo mount /dev/nvme0n1p1 /mnt/boot/efi
sudo pacstrap /mnt base linux linux-firmware btrfs-progs dosfstools exfatprogs exfat-utils e2fsprogs ntfs-3g udftools networkmanager nano gedit man-db man-pages mandoc
sudo genfstab -U /mnt >> /mnt/etc/fstab
sudo arch-chroot /mnt
sudo ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
sudo hwclock --localtime
sudo hwclock --systohc