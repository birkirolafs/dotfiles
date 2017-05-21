#!/bin/sh

echo -e "\n\nFetching pems"
echo "=============================="

if [ ! -d $HOME/.ssh/kara ]; then
    echo "Creating ~/.ssh/kara"
    mkdir -p $HOME/.ssh/kara
fi
ids=$(lpass ls kara | grep -Eo '[[:digit:]]+')
for id in $ids; do
	filename=$(lpass show $id --field="Filename")
	domain=$(lpass show $id --field="Domain")
    if [ -e ~/.ssh/kara/$filename ]; then
        echo "~/.ssh/kara/$filename already exists... Skipping."
    else
        echo "Adding $filename for $domain to ~/.ssh/kara/"
        lpass show $id --notes > ~/.ssh/kara/$filename
        chmod 400 ~/.ssh/kara/$filename
    fi
done
