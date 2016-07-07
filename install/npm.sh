#!/bin/bash

echo -e "\n\nInstalling npm global modules"
echo "=============================="
npm config set loglevel silent
npm install -g diff-so-fancy
npm install -g jshint
npm install -g jscs
