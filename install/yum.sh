#!/bin/sh

# taken from https://github.com/neovim/neovim/wiki/Installing-Neovim
echo -e "\n\nInstalling essential binaries with yum"
echo "=============================="
yum -y -q install epel-release
curl -s -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo 
yum -y -q install neovim

yum -y -q install git tree htop ack
