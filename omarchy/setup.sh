#!/bin/bash

sudo sh -c './install-packages.sh; ./remap-capslock-to-esc.sh'

./make-symbolic-links-to-config-files.sh

./install-extra-themes.sh

# get wallpapers
cd ~/Desktop
git clone https://github.com/dharmx/walls.git
cd -
