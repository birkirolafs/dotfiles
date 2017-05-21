#!/bin/sh

# taken from https://github.com/tmux/tmux 
echo -e "\n\nInstalling tmux from source"
echo "=============================="

if [ ! -d $HOME/src ]; then
    echo "Creating ~/src"
    mkdir -p $HOME/src
fi

if [ -d $HOME/src/tmux ]; then
    echo -e "tmux already installed... Skipping."
else
    git clone https://github.com/tmux/tmux.git ~/src/tmux
    pushd ~/src/tmux
    sh autogen.sh
    ./configure && make
    sudo make install
    popd
fi
