#!/usr/bin/env bash


# Copy config file to new machine

# Check if user is root (UID 0) or using sudo
if [ "$EUID" -ne 0 ]; then
    echo "[-] This script must be run as root or with sudo."
    exit 1
fi

# Execute from the dir the script is in
cd "$(dirname "$0")" || exit

# Sync local config files with cloned repo so i can push up my changes
cp -v ./config/.bash_aliases  $HOME
cp -v ./config/.bash_git  $HOME
cp -v ./config/.bash_pbx  $HOME
cp -v ./config/.bash_utils  $HOME
cp -v ./config/.bashrc  $HOME
cp -v ./config/.p10k.zsh  $HOME
cp -v ./config/.tmux.conf  $HOME
cp -v ./config/nvim  $HOME
cp -v ./config/.vimrc  $HOME
cp -v ./config/.zshrc   $HOME
cp -v ./config/.tmux_init.sh  $HOME
cp -v -r ./config/.config/nvim  $HOME

cp -v ./config/usr_local_bin/* /usr/local/bin/


echo "Done!"

