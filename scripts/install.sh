#!/bin/bash
# Script used to setup this repository from scratch

echo "Identifying your shell"
# add node path in your PATH
if [[ $SHELL == "/bin/bash" ]]; then
    rcFile="$HOME/.bashrc"
elif [[ $SHELL == "/bin/zsh" ]]; then
    rcFile="$HOME/.zshrc"
else
    echo "Unsupported shell, please manually update your path for nvim or node"
    rcFile="$HOME/unknown-shell"
fi

echo "Cloning nvim repository"
mkdir -p ~/.config

echo "Backup old nvim, if present"
[ -d "$HOME/.config/nvim" ] && mv $HOME/.config/nvim $HOME/.config/nvim.bk_$RANDOM

git clone https://github.com/icadariu/nvim.git ~/.config/nvim

if ! command -v nvim >/dev/null 2>&1; then
    echo "nvim not available. I will install latest version"

    curl -Lso /tmp/nvim-linux64.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo tar -zxf /tmp/nvim-linux64.tar.gz -C /opt/

    echo "export PATH=$PATH:/opt/nvim-linux64/bin" >> $rcFile
fi

if ! command -v go >/dev/null 2>&1; then
    echo "go not available. I will install go using snap"

    sudo snap refresh
    sudo snap install go --classic
fi

echo "Installing other tools used by nvim setup"
sudo apt install -y python3-pip python3-neo python3-yamlfix ripgrep cargo luarocks fd-find xclip

echo "This setup uses lazygit. I will now install lazygit if not present!"

if ! command -v go >/dev/null 2>&1; then
    echo "lazygit not available. I will install go using snap"

    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lso /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar -zxf /tmp/lazygit.tar.gz -C /tmp/
    sudo install /tmp/lazygit /usr/local/bin
fi

echo "Do you want to have node installed in your local folder? y/n "
read answer

if [[ ${answer} == 'y' ]]; then
    # Ref: https://johnpapa.net/node-and-npm-without-sudo/
    # https://nodejs.org/en/download/prebuilt-binaries
    node_version='v22.9.0'

    mkdir -p $HOME/tools && cd $HOME/tools

    wget https://nodejs.org/dist/${node_version}/node-${node_version}-linux-x64.tar.xz
    # extract node to a custom directory, the directory should exist.
    tar xvf node-${node_version}-linux-x64.tar.xz --directory=$HOME/tools

    echo "export PATH=$HOME/tools/node-${node_version}-linux-x64/bin:$PATH" >> $rcFile

    mkdir -p $HOME/.npm-packages
    npm config set prefix ~/.npm-packages

    npm install neovim

else
    echo "Node installation skipped"
fi
