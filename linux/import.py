

pacman_packages = []
yay_packages = []
flatpak_packages = []
system_services = []

def main():
    pacman_install()


def pacman_install():
    for package in pacman_packages:
        print("")
