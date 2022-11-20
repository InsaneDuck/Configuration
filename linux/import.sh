echo "adding g14 repo"
#sh scripts/add-g14-repo.sh

echo "installing pacman packages"
sudo xargs pacman -S --needed --noconfirm < configs/pacman-packages.txt

echo "installing yay"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

echo "setting up rust"
rustup default stable

echo "installing aur packages"
xargs yay -S --needed --noconfirm < configs/yay-packages.txt

echo "installing flatpak packages"
sh scripts/flatpak.sh

echo "removing packages"
sh scripts/remove-packages.sh

echo "setting up bootloader"
sudo bootctl remove
sudo refind-install
sudo mkdir -p /boot/EFI/refind/drivers_x64
sudo cp /usr/share/refind/drivers_x64/btrfs_x64.efi /boot/EFI/refind/drivers_x64/btrfs_x64.efi

echo "setting up user-groups"
sudo usermod -aG docker ${USER}
sudo usermod -a -G kvm $(whoami)
sudo usermod -a -G libvirt $(whoami)

echo "setting up mariadb"
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

echo "setting up synth shell"
git clone --recursive https://github.com/andresgongora/synth-shell.git
chmod +x synth-shell/setup.sh
cd synth-shell
./setup.sh
cd ..
rm -rf synth-shell

echo "enabling installed services"
sh scripts/services.sh

echo "restoring extensions"
busctl --user call org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Extensions InstallRemoteExtension s "extensions-sync@elhan.io"
gnome-extensions enable extensions-sync@elhan.io
dconf reset -f /org/gnome/shell/extensions/extensions-sync/
dconf load /org/gnome/shell/extensions/extensions-sync/ < /home/satya/Github/configuration/linux/configs/extension-sync-settings.txt
busctl --user call org.gnome.Shell /io/elhan/ExtensionsSync io.elhan.ExtensionsSync read

echo "setting up git"
git config --global user.name "satya"
git config --global user.email "39309626+InsaneDuck@users.noreply.github.com"