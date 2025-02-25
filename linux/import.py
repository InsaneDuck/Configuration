import shutil
import subprocess

sudo = "sudo"
pacman = "pacman"
systemctl = "systemctl"
install = "-S"
remove = "-R"
yay = "yay"
enable = "enable"
disable = "disable"

packages_to_install = ["alsa-utils",
                       "android-tools",
                       "archlinux-appstream-data",
                       "aspnet-runtime",
                       "asusctl",
                       "base-devel",
                       "bash-completion",
                       "bleachbit",
                       "cronie",
                       "cups",
                       "dbeaver",
                       "dconf-editor",
                       "discord",
                       "dmidecode",
                       "dnsmasq",
                       "docker",
                       "docker-compose",
                       "docker-scan",
                       "dotnet-host",
                       "exfatprogs",
                       "f2fs-tools",
                       "ffmpeg",
                       "ffmpegthumbnailer",
                       "firefox",
                       "fish",
                       "flatpak",
                       "gedit",
                       "gimp",
                       "git",
                       "gnome-terminal",
                       "gnome-themes-extra",
                       "go",
                       "gpart",
                       "gparted",
                       "gradle",
                       "gst-libav",
                       "gst-plugins-ugly",
                       "gthumb",
                       "hdparm",
                       "intel-media-driver",
                       "intel-media-sdk",
                       "intel-ucode",
                       "java17-openjfx",
                       "jdk17-openjdk",
                       "lib32-libva-mesa-driver",
                       "lib32-mesa-vdpau",
                       "lib32-nvidia-utils",
                       "lib32-vkd3d",
                       "libappindicator-gtk3",
                       "libreoffice-fresh",
                       "libva-intel-driver",
                       "libva-mesa-driver",
                       "libva-vdpau-driver",
                       "linux-firmware-qlogic",
                       "linux-headers",
                       "mariadb",
                       "maven",
                       "mkvtoolnix-cli",
                       "mpv",
                       "mysql-workbench",
                       "nautilus-share",
                       "neofetch",
                       "noto-fonts",
                       "noto-fonts-cjk",
                       "noto-fonts-emoji",
                       "noto-fonts-extra",
                       "ntfs-3g",
                       "nvidia-utils",
                       "obs-studio",
                       "pigz",
                       "powerline-fonts",
                       "power-profiles-daemon",
                       "qbittorrent",
                       "qemu",
                       "qt5-wayland",
                       "refind",
                       "rustup",
                       "smartmontools",
                       "smbclient",
                       "steam",
                       "supergfxctl",
                       "ttf-font-awesome",
                       "ttf-jetbrains-mono",
                       "udftools",
                       "v4l2loopback-dkms",
                       "virt-manager",
                       "vkd3d",
                       "vlc",
                       "vulkan-intel",
                       "vulkan-mesa-layers",
                       "wget",
                       "wine",
                       "yarn",
                       "youtube-dl",
                       "tree",
                       "snapper"]
aur_packages = ["aic94xx-firmware",
                "chiaki",
                "cowfortune",
                "downgrade",
                "google-chrome",
                "iriunwebcam-bin",
                "jetbrains-toolbox",
                "pamac-aur",
                "rpi-imager",
                "timeshift",
                "upd72020x-fw",
                "visual-studio-code-bin",
                "wd719x-firmware",
                "refind-btrfs",
                "btrfs-assistant"]
flatpak_packages = []
system_services = ["avahi-daemon",
                   "bluetooth",
                   "cronie",
                   "cups",
                   "docker",
                   "emby-server",
                   "libvirtd",
                   "portmaster",
                   "power-profiles-daemon",
                   "supergfxd"]

packages_to_remove = [] = []


def install_packages():
    for package in packages_to_install:
        subprocess.run([sudo, pacman, install, package, "--needed", "--noconfirm"])


def remove_packages():
    for package in packages_to_remove:
        subprocess.run([sudo, pacman, remove, package])


def install_aur_packages():
    for package in aur_packages:
        subprocess.run([yay, install, package, "--needed", "--noconfirm"])


def install_aur_helper():
    # Check if yay is already installed
    if shutil.which("yay") is None:
        # Install git
        subprocess.run([sudo, pacman, "-S", "git"])

        # Clone yay repository from GitHub
        subprocess.run(["git", "clone", "https://aur.archlinux.org/yay.git"])

        # Navigate to yay directory and build and install yay
        subprocess.run(["cd", "yay"])
        subprocess.run(["makepkg", "-si", "--noconfirm"])
        subprocess.run(["cd", ".."])
        subprocess.run(["rm", "-rf", "yay"])
    else:
        print("yay is already installed")


def enable_services():
    for service in system_services:
        subprocess.run([sudo, systemctl, enable, service])


def main():
    install_packages()
    install_aur_helper()
    install_aur_packages()
    enable_services()


if __name__ == "__main__":
    main()
