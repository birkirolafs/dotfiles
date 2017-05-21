#!/bin/bash

echo -e "\n\nInstalling nvm"
echo "=============================="
if [ -e $HOME/.nvm ]; then
	echo "nvm already installed... Skipping."
else
	LATEST_VERSION=$(curl -s https://api.github.com/repos/creationix/nvm/releases/latest | python -c 'import sys, json; print json.load(sys.stdin)["name"];')
	curl -s https://raw.githubusercontent.com/creationix/nvm/$LATEST_VERSION/install.sh | bash
	echo  "Reloading .bashrc"
	source ~/.bashrc
	echo  "Installing latest stable release of NodeJS"
    nvm install v4.4.0
	nvm install stable
	nvm alias default stable
fi
