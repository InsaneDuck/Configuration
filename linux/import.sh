echo "adding g14 repo"
sudo sh -c "echo '[g14]' >> /etc/pacman.conf"
sudo sh -c "echo 'SigLevel = DatabaseNever Optional TrustAll' >> /etc/pacman.conf"
sudo sh -c "echo 'Server = https://arch.asus-linux.org' >> /etc/pacman.conf"
sudo pacman -Syu

echo "installing pacman packages"
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
sudo cp configs/refind-theme-regular /boot/EFI/refind/themes
#sudo sh -c "echo '# Load rEFInd theme Regular' >> /boot/EFI/refind/refind.conf"
#sudo sh -c "echo 'include themes/refind-theme-regular/theme.conf' >> /boot/EFI/refind/refind.conf"

echo "setting up user-groups"
sudo usermod -aG docker ${USER}
sudo usermod -a -G kvm $(whoami)
sudo usermod -a -G libvirt $(whoami)

echo "setting up mariadb"
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

echo "installing yay"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

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
#sh scripts/flatpak.sh

echo "setting up git"
git config --global user.name "satya"
git config --global user.email "39309626+InsaneDuck@users.noreply.github.com"

#echo "setting up synth shell"
#git clone --recursive https://github.com/andresgongora/synth-shell.git
#chmod +x synth-shell/setup.sh
#cd synth-shell
#./setup.sh
#cd ..
#rm -rf synth-shell
