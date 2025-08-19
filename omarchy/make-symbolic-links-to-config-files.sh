# bash
PATH_TO_CONFIG_FILES=$PWD
pushd
cd

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
ln -s $PATH_TO_CONFIG_FILES/lazyvim/lua/plugins/lualine.lua
cd ~/.config/nvim/lua/config
rm keymaps.lua options.lua 2>/dev/null
ln -s $PATH_TO_CONFIG_FILES/lazyvim/lua/config/keymaps.lua
ln -s $PATH_TO_CONFIG_FILES/lazyvim/lua/config/options.lua

cd ~/.config/hypr
mv bindings.conf bindings.conf.bak
mv monitors.conf monitors.conf.bak
ln -s $PATH_TO_CONFIG_FILES/hypr/bindings.conf
ln -s $PATH_TO_CONFIG_FILES/hypr/monitors.conf

popd
