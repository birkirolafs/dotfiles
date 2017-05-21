#!/bin/sh

echo -e "\n\nInstalling pyenv"
echo "=============================="

if [ ! -d $HOME/.pyenv ]; then
    $(git clone https://github.com/pyenv/pyenv.git ~/.pyenv)
    echo "~/.pyenv Created!"
else
    echo "~/.pyenv already exists... Skipping."
fi
