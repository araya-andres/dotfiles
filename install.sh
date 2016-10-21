#!/bin/bash
PATH_TO_CONFIG_FILES=$1
if [ -z "$PATH_TO_CONFIG_FILES" ]; then PATH_TO_CONFIG_FILES=$PWD; fi
PREV_DIR=$PWD
cd
echo "[ -f $PATH_TO_CONFIG_FILES/bash/bash_profile.txt ] && source $PATH_TO_CONFIG_FILES/bash/bash_profile.txt" >> ~/.bash_profile
ln -s $PATH_TO_CONFIG_FILES/git/gitconfig.txt .gitconfig
ln -s $PATH_TO_CONFIG_FILES/octave/octaverc.txt .octaverc
ln -s $PATH_TO_CONFIG_FILES/tmux/tmux_conf.txt .tmux.conf
mkdir .config
cd .config
ln -s $PATH_TO_CONFIG_FILES/nvim
cd $PREV_DIR
