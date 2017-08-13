#!/bin/bash
PATH_TO_CONFIG_FILES=$1
if [ -z "$PATH_TO_CONFIG_FILES" ]; then PATH_TO_CONFIG_FILES=$PWD; fi
PREV_DIR=$PWD
cd

# bash
echo "[ -f $PATH_TO_CONFIG_FILES/bash/bash_profile.txt ] && source $PATH_TO_CONFIG_FILES/bash/bash_profile.txt" >> ~/.bash_profile

# git
rm .gitconfig
ln -s $PATH_TO_CONFIG_FILES/git/gitconfig.txt .gitconfig

# octave
rm .octaverc
ln -s $PATH_TO_CONFIG_FILES/octave/octaverc.txt .octaverc

# tmux
rm .tmux.conf
ln -s $PATH_TO_CONFIG_FILES/tmux/tmux.conf .tmux.conf

# nvim
mkdir .vim_undo_dir
mkdir .config
cd .config
ln -s $PATH_TO_CONFIG_FILES/nvim

cd $PREV_DIR
