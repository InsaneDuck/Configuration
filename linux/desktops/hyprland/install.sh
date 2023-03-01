#!/bin/bash
set -e

echo "Enabling Wayland"
sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules

echo "Installing Required Packages"
yay -S mutter-dynamic-buffering hyprland-nvidia-git

echo "Copying Config"
cp -r hypr ~/.config

sudo cp hyprland-wrapped.desktop /usr/share/wayland-sessions/