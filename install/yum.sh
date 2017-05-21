#!/bin/sh

# taken from https://github.com/neovim/neovim/wiki/Installing-Neovim
echo -e "\n\nInstalling essential binaries with yum"
echo "=============================="

echo -e "\n\nAdding repositories for yum"

yum -y -q install epel-release
curl -s -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo 
yum -y -q group install "Development Tools"
yum -y -q install gcc gcc-c++ make automake pkgconfig git-core ncurses-devel patch openssl-devel zlib-devel readline-devel sqlite-devel bzip2-devel mysql-devel libevent-devel
yum -y -q install neovim
yum -y -q install mariadb-server
yum -y -q install ack
yum -y -q install git 
yum -y -q install tree
yum -y -q install htop
yum -y -q install docker
yum -y -q install lastpass-cli
yum -y -q install gimp
