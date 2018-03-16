#!/usr/bin/env bash

stty -echo         # turn-off echoing.
read -s -p Password: pwd
stty echo		   # turn-on  echoing

echo -e "\n\nInitializing dotfiles"

#echo "Initializing submodule(s)"
#git submodule update --init --recursive

source install/link.sh

if [ "$(uname)" == "Linux" ]; then
	echo -e "\n\nRunning on Linux"

	# sudo install binaries with yum
	echo -e $pwd | sudo -S ./install/arch.sh

    source install/yaourt.sh
    source install/pacman.sh
    source install/npm.sh
fi

if [ "$(uname)" == "Darwin" ]; then
	echo -e "\n\nRunning on OSX"

	source install/brew.sh
fi

unset pwd

echo "done"
