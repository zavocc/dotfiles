#!/usr/bin/env bash
# get the realpath of this script and cd to its directory
cd "$(dirname "$(realpath "$0")")"

# Apps
APPS=(
    ".gitconfig"
    ".config/starship.toml"
    ".config/nvim"
    ".bashrc_extern"
)

# copy files
for x in ${APPS[@]}; do  
    echo -e "[i] Installing apps: \e[4m$x\e[0m to \e[4m~/$x\e[0m"
    # check if there is a .config/ prefix in the files iterated
    if [[ $x == .config/* ]]; then
        # check if the directory exists
        if [ ! -d ~/.config ]; then
            mkdir ~/.config -p
        fi

        cp linux-home/$x ~/.config -a
    fi

    cp linux-home/$x ~ -a
done

# append the .bashrc file with the contents of external bashrc
if ! grep -qs ". ~/.bashrc_extern" ~/.bashrc; then
    echo ". ~/.bashrc_extern" >> ~/.bashrc
fi
