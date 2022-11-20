sudo xargs pacman -S --needed --noconfirm < bspwm-packages.txt
cp -r bspwm ~/.config
cp -r sxhkd ~/.config
cp -r polybar ~/.config