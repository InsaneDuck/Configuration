#!/bin/bash
#to exit script if any command fails
set -e

echo "installing pacman packages"
sudo xargs pacman -S --needed --noconfirm < configs/pacman-driver-packages.txt
sudo xargs pacman -S --needed --noconfirm < configs/pacman-packages.txt


echo "removing packages"
sudo pacman -R --noconfirm gnome-software-packagekit-plugin
sudo pacman -R --noconfirm gnome-software
sudo pacman -R --noconfirm malcontent
#sudo pacman -R --noconfirm gnome-console
sudo pacman -Runs --noconfirm gnome-photos
sudo pacman -Runs --noconfirm totem
sudo pacman -Runs --noconfirm gnome-weather
sudo pacman -Runs --noconfirm epiphany
sudo pacman -Runs --noconfirm gnome-contacts
sudo pacman -Runs --noconfirm eog
sudo pacman -Runs --noconfirm gnome-maps
sudo pacman -Runs --noconfirm gnome-music
#reinstalling this to fix cache?
sudo pacman -S --noconfirm archlinux-appstream-data

echo "setting up rust"
rustup default stable

echo "setting up bootloader"
sudo bootctl remove
sudo refind-install
sudo mkdir -p /boot/EFI/refind/drivers_x64
sudo mkdir -p /boot/EFI/refind/themes
sudo cp /usr/share/refind/drivers_x64/btrfs_x64.efi /boot/EFI/refind/drivers_x64/btrfs_x64.efi
sudo cp -r configs/refind-theme-regular /boot/EFI/refind/themes
echo "# Load rEFInd theme Regular" | sudo tee -a /boot/EFI/refind/refind.conf
echo "include themes/refind-theme-regular/theme.conf" | sudo tee -a /boot/EFI/refind/refind.conf

echo "setting up user-groups"
sudo usermod -aG docker "${USER}"
sudo usermod -a -G kvm "$(whoami)"
sudo usermod -a -G libvirt "$(whoami)"

echo "setting up mariadb"
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

echo "installing yay"
# Check if yay is installed
if ! command -v yay &> /dev/null; then
  # Install yay
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
else
  echo "yay is already installed"
fi

echo "installing aur packages"
xargs yay -S --needed --noconfirm < configs/yay-packages.txt

echo "enabling installed services"
sudo systemctl enable avahi-daemon
sudo systemctl enable bluetooth
sudo systemctl enable cronie
sudo systemctl enable cups
sudo systemctl enable docker
#sudo systemctl enable emby-server
sudo systemctl enable libvirtd
#sudo systemctl enable portmaster
sudo systemctl enable power-profiles-daemon
sudo systemctl enable supergfxd

echo "restoring extensions"
busctl --user call org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Extensions InstallRemoteExtension s "extensions-sync@elhan.io"
gnome-extensions enable extensions-sync@elhan.io
dconf reset -f /org/gnome/shell/extensions/extensions-sync/
dconf load /org/gnome/shell/extensions/extensions-sync/ < /home/satya/Github/configuration/linux/configs/extension-sync-settings.txt
busctl --user call org.gnome.Shell /io/elhan/ExtensionsSync io.elhan.ExtensionsSync read

echo "installing flatpak packages"
flatpak install flathub org.cubocore.CoreKeyboard -y

echo "setting up git"
git config --global user.name "satya"
git config --global user.email "39309626+InsaneDuck@users.noreply.github.com"

echo "Adding asus stuff"
# Check if repository is already present
if grep -q "g14" /etc/pacman.conf; then
  echo "g14 Repository already present"
else
  # Add repository to pacman configuration file
  echo "" | sudo tee -a /etc/pacman.conf
  echo "#asus-linux repository" | sudo tee -a /etc/pacman.conf
  echo "[g14]" | sudo tee -a /etc/pacman.conf
  echo "SigLevel = DatabaseNever Optional TrustAll" | sudo tee -a /etc/pacman.conf
  echo "Server = https://arch.asus-linux.org" | sudo tee -a /etc/pacman.conf
  echo "g14 Repository added"
  # Update package database
  sudo pacman -Sy
fi

sudo pacman -S asusctl supergfxctl rog-control-center

#echo "restoring dconf"
#dconf reset -f /
#dconf load / < dconf-dump