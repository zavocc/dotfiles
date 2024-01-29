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

# Provisioning provider (cp -a is default)
[[ x$PROVISIONING_PROVIDER == x ]] && PROVISIONING_PROVIDER="cp -a"

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
        $PROVISIONING_PROVIDER linux-home/$x ~/.config
        continue
    fi

    # Check if its a termux directory
    if [[ $x == .termux/ ]]; then
        # check if we're actually in Termux env
        if [[ -d /data && -d /system/app && -d /storage/emulated ]] && command -v termux-reload-settings >/dev/null; then
            # copy files to termux home and immediately reload settings to prevent crash
            echo -e "[i] Installing apps: \e[4m$x\e[0m to \e[4m~/$x\e[0m"
            $PROVISIONING_PROVIDER linux-home/$x ~; termux-reload-settings
        fi
        continue
    fi

    # copy files
    echo -e "[i] Installing apps: \e[4m$x\e[0m to \e[4m~/$x\e[0m"
    $PROVISIONING_PROVIDER linux-home/$x ~
done

# also copy global WSL config if we're in WSL
if [[ -d /mnt/c/Windows/System32 ]] && mountpoint /mnt/c >/dev/null && command -v wslpath >/dev/null; then
    # Determine the user's username
    USER="$(basename $(wslpath $(powershell.exe -c 'echo $env:USERPROFILE' | tr -d '\r')))"

    echo -e "[i] Installing apps: \e[4mwindows-home/.wslconfig\e[0m to \e[4m/mnt/c/Users/$USER/.wslconfig\e[0m"
    cp -a windows-home/.wslconfig /mnt/c/Users/$USER/.wslconfig
fi

# append the .bashrc file with the contents of external bashrc
if ! grep -qs ". ~/.bashrc_extern" ~/.bashrc; then
    echo ". ~/.bashrc_extern" >> ~/.bashrc
fi
