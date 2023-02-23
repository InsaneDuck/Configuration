
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