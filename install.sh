#!/bin/bash

xcode-select --install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# pyenv prereq

brew install openssl readline sqlite3 xz zlib

brew install docker \
             docker-compose \
             fxf \
             neovim \
             pyenv \
             tmux \
             tig \
             tree \
             wget

brew install --cask epic-games \
                    gog-galaxy \
                    iterm2 \
                    spectacle \
                    steam \
                    virtualbox \
                    visual-studio-code \
                    vlc \
                    whatsapp
