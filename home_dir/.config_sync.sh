#!/usr/bin/env bash


echo "Running..."

DEST=~/my_repos/Dev-Environment/home_dir/
cp -v ~/.bash_aliases  $DEST
cp -v ~/.bash_git  $DEST
cp -v ~/.bash_pbx  $DEST
cp -v ~/.bash_utils  $DEST
cp -v ~/.bashrc  $DEST
cp -v -r ~/.config/  $DEST
cp -v ~/.p10k.zsh  $DEST
cp -v ~/.tmux.conf  $DEST
cp -v ~/.vimrc  $DEST
cp -v ~/.zshrc   $DEST
cp -v ~/.config_sync.sh  $DEST
cp -v ~/.tmux_init.sh  $DEST
echo "Done!"
