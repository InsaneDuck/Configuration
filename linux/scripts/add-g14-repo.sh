sudo sh -c "echo '[g14]' >> /etc/pacman.conf"
sudo sh -c "echo 'SigLevel = DatabaseNever Optional TrustAll' >> /etc/pacman.conf"
sudo sh -c "echo 'Server = https://arch.asus-linux.org' >> /etc/pacman.conf"
sudo pacman -Syu
