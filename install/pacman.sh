#!/bin/sh

echo -e "\n\nInstalling essential binaries with pacman"
echo "=============================="

sudo pacman -S -q --noconfirm --needed git
sudo pacman -S -q --noconfirm --needed tmux
sudo pacman -S -q --noconfirm --needed neovim
sudo pacman -S -q --noconfirm --needed python-neovim
sudo pacman -S -q --noconfirm --needed python2-neovim
sudo pacman -S -q --noconfirm --needed tree
sudo pacman -S -q --noconfirm --needed htop
sudo pacman -S -q --noconfirm --needed gimp
sudo pacman -S -q --noconfirm --needed docker
sudo pacman -S -q --noconfirm --needed openssl
