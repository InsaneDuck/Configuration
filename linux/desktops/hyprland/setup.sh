#!/bin/bash
#to exit script if any command fails
set -e

echo "Enabling Wayland"
sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules

echo "Installing Packages"
yay -S --noconfirm mutter-dynamic-buffering hyprland-nvidia-git

echo "Copying Configs"
cp hypr  ~/.config
sudo cp hyprland-wrapped.desktop /usr/share/wayland-sessions/