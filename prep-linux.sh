#!/usr/bin/env bash
# get the realpath of this script and cd to its directory
cd "$(dirname "$(realpath "$0")")"

# append the .bashrc file with the contents of external bashrc
if ! grep -qs ". ~/.bashrc_extern" ~/.bashrc; then
    cp linux-home/.bashrc_extern ~/.bashrc_extern
    echo ". ~/.bashrc_extern" >> ~/.bashrc
fi

# copy neovim config if it doesn't exist and only if there is no runtime files yet
if [ ! -d ~/.config/nvim ] || [ ! -f ~/.config/nvim/init.lua ] && [ ! -d ~/.local/share/nvim/site ]; then
    cp -r linux-home/.config/nvim ~/.config/nvim
fi
