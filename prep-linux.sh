#!/usr/bin/env bash
# get the realpath of this script and cd to its directory
cd "$(dirname "$(realpath "$0")")"

# Apps
APPS=(
    ".bashrc_extern"
    ".config/starship.toml"
    ".config/nvim"
    ".gitconfig"
    ".termux/"
)

# copy files
for x in ${APPS[@]}; do
    # check if there is a config/ prefix in the files iterated
    if [[ $x == .config/* ]]; then
        # check if config directory exists
        if [[ ! -d ~/.config ]]; then
            mkdir ~/.config -p
        fi

        # Copy files to ~/.config
        echo -e "[i] Installing apps: \e[4m$x\e[0m to \e[4m~/$x\e[0m"
        cp linux-home/$x ~/.config -a
        continue
    fi

    # Check if its a termux directory
    if [[ $x == .termux/ ]]; then
        # check if we're actually in Termux env
        if [[ -d /data && -d /system/app && -d /storage/emulated ]] && command -v termux-reload-settings >/dev/null 2>&1; then
            # copy files to termux home and immediately reload settings to prevent crash
            echo -e "[i] Installing apps: \e[4m$x\e[0m to \e[4m~/$x\e[0m"
            cp linux-home/$x ~ -a; termux-reload-settings
        fi
        continue
    fi

    # copy files
    echo -e "[i] Installing apps: \e[4m$x\e[0m to \e[4m~/$x\e[0m"
    cp linux-home/$x ~ -a
done

# append the .bashrc file with the contents of external bashrc
if ! grep -qs ". ~/.bashrc_extern" ~/.bashrc; then
    echo ". ~/.bashrc_extern" >> ~/.bashrc
fi
