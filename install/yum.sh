#!/bin/sh

# taken from https://github.com/neovim/neovim/wiki/Installing-Neovim
echo -e "\n\nInstalling essential binaries with yum"
echo "=============================="

echo -e "\n\nAdding repositories for yum"

yum -y -q install epel-release
curl -s -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo 
yum -y -q install neovim
yum -y -q install ack
yum -y -q install git 
yum -y -q install tree
yum -y -q install htop
yum -y -q install docker
yum -y -q install tmux
