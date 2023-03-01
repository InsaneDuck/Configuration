sudo systemctl enable nvidia-suspend.service nvidia-hibernate.service nvidia-resume.service
sudo mkdir /nvidia
sudo cp nvidia-power-management.conf /etc/modprobe.d/
sudo mkinitcpio -P