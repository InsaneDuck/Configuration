#!/bin/env bash
sudo pacman -S qemu libvirt edk2-ovmf virt-manager ebtables dnsmasq tree

sudo nano /etc/supergfxd.conf

sudo systemctl restart supergfxd

#hooks helper (executes when starting vm and stopping vm)
sudo mkdir -p /etc/libvirt/hooks/qemu.d && sudo wget 'https://asus-linux.org/files/vfio/libvirt_hooks/qemu' -O /etc/libvirt/hooks/qemu && sudo chmod +x /etc/libvirt/hooks/qemu

sudo systemctl restart libvirtd

#folder structure
sudo mkdir /etc/libvirt/hooks/qemu.d/win10 && sudo mkdir -p /etc/libvirt/hooks/qemu.d/win10/prepare/begin && sudo mkdir -p /etc/libvirt/hooks/qemu.d/win10/release/end

sudo tree /etc/libvirt/hooks/

#copy vm config for pinning cpu cores
sudo cp /home/satya/Github/configuration/linux/kvm/vm-vars.conf /etc/libvirt/hooks/qemu.d/win10/

#scripts to execute before starting vm and after shutting down vm
sudo cp /home/satya/Github/configuration/linux/kvm/10-asusd-vfio.sh /etc/libvirt/hooks/qemu.d/win10/prepare/begin/
sudo cp /home/satya/Github/configuration/linux/kvm/40-asusd-integrated.sh /etc/libvirt/hooks/qemu.d/win10/release/end/

#setting above scripts as executable
sudo chmod +x /etc/libvirt/hooks/qemu.d/win10/prepare/begin/10-asusd-vfio.sh
sudo chmod +x /etc/libvirt/hooks/qemu.d/win10/release/end/40-asusd-integrated.sh

sudo tree /etc/libvirt/hooks

#adding user to libvirt and kvm user group
sudo usermod -aG libvirt,kvm satya
