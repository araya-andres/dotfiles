#!/bin/bash
PATH_TO_CONFIG_FILES=${1-$PWD}
cd

yes | sudo pacman -S interception-caps2esc brave-bin localsend tmux tree

# Remap Caps Lock to Escape
# https://ejmastnak.com/tutorials/arch/caps2esc/
FILE="/etc/udevmon.yaml"
if [-f $FILE]; the
    sudo cp $FILE $FILE.bak
fi
sudo cat >$FILE <<EOF
- JOB: "intercept -g \$DEVNODE | caps2esc | uinput -d \$DEVNODE"
  DEVICE:
    EVENTS:
      EV_KEY: [KEY_CAPSLOCK, KEY_ESC]
EOF

FILE="/etc/systemd/system/udevmon.service"
if [-f $FILE]; the
    sudo cp $FILE $FILE.bak
fi
sudo cat >$FILE <<EOF
[Unit]
Description=udevmon
Wants=systemd-udev-settle.service
After=systemd-udev-settle.service

[Service]
ExecStart=/usr/bin/nice -n -20 /usr/bin/udevmon -c /etc/udevmon.yaml

[Install]
WantedBy=multi-user.target
EOF

# Enable and start the `udevmon` service
sudo systemctl enable --now udevmon.service

# Optionally verify the `udevmon` service is active and running
systemctl status udevmon

# bash
rm .bashrc 2>/dev/null
ln -s $PATH_TO_CONFIG_FILES/bash/bashrc .bashrc

# tmux
rm .tmux.conf 2>/dev/null
ln -s $PATH_TO_CONFIG_FILES/tmux/tmux.conf .tmux.conf

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# tmux catppuccin
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux

# lazyvim
cd ~/.config/nvim/lua/plugins
ln -s $PATH_TO_CONFIG_FILES/lazyvim/lua/plugins/blink.lua
ln -s $PATH_TO_CONFIG_FILES/lazyvim/lua/plugins/disabled.lua
cd ~/.config/nvim/lua/config
rm keymaps.lua options.lua 2>/dev/null
ln -s $PATH_TO_CONFIG_FILES/lazyvim/lua/config/keymaps.lua
ln -s $PATH_TO_CONFIG_FILES/lazyvim/lua/config/options.lua

cd ~/.config/hypr
mv bindings.conf bindings.conf.bak
mv monitors.conf monitors.conf.bak
ln -s $PATH_TO_CONFIG_FILES/hypr/bindings.conf
ln -s $PATH_TO_CONFIG_FILES/hypr/monitors.conf
