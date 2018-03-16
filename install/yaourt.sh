#!/bin/sh

echo -e "\n\nInstalling yaourt"
echo "=============================="

if hash yaourt 2> /dev/null; then
    echo "yaourt already installed ... Skipping!"
else
	echo -e "Adding yaourt repository to pacman.conf"
    echo -e "\n# Repository to install yaourt\n[archlinuxfr]\nSigLevel = Never\nServer = http://repo.archlinux.fr/$arch" |  sudo tee -a /etc/pacman.conf > /dev/null 
    sudo pacman -Sy -q --noconfirm yaourt
fi

yaourt -S --noconfirm pyenv
yaourt -S --noconfirm nvm
