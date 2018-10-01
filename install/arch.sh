#!/bin/sh

# taken from https://github.com/ryanoasis/nerd-fonts
echo -e "\n\nInstalling custom fonts for gnome-terminal"
echo "=============================="


fonts="$HOME/.local/share/fonts"
fontname="Anonymice Powerline Nerd Font Complete Mono"
src="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/AnonymousPro/complete/Anonymice%20Powerline%20Nerd%20Font%20Complete%20Mono.ttf"

if [ ! -d $fonts ]; then
    echo "Creating ~/.local/share/fonts"
	mkdir -p $fonts
fi

if [ -e "$fonts/$fontname.ttf" ]; then
	echo -e "$fontname already installed... Skipping."
else
	echo -e "Adding $fontname"
	curl --silent -fLo "$fonts/$fontname.ttf" $src
	echo "Refreshing font cache"
	sudo fc-cache -f
fi

echo -e "\n\nInstalling onedark theme for gnome-terminal"
echo "=============================="
wget -q https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh > /tmp/one-dark.sh && (sh one-dark.sh)
echo "Please re-open terminal to load new profile changes"
