#!/usr/bin/env bash

echo "Initializing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

echo "Initializing submodule(s) Completed !"
echo "Initializing dotfiles     Completed !"
