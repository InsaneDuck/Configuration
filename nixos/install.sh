sudo nix-channel --update
sudo cp configuration.nix /etc/nixos/configuration.nix
sudo cp packages.nix /etc/nixos/packages.nix

sudo nixos-rebuild switch --upgrade