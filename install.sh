xcode-select --install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# pyenv prereq

brew install openssl readline sqlite3 xz zlib

brew install neovim \
             pyenv \
             tmux \
             tree \
             wget

brew install --cask spectacle \
                    virtualbox \
                    visual-studio-code \
                    vlc \
                    whatsapp
