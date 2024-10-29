#!/bin/bash
# Script used to setup this repository from scratch

echo "Identifying your shell"
# add node path in your PATH
if [[ $SHELL == "/bin/bash" ]]; then
    rcFile="${HOME}/.bashrc"
    echo "${rcFile}"
elif [[ $SHELL == "/bin/zsh" ]]; then
    rcFile="{$HOME}/.zshrc"
    echo "${rcFile}"
else
    echo "Unsupported shell, please manually update your path for nvim or node"
    rcFile="${HOME}/unknown-shell"
    echo "${rcFile}"
fi

echo "Cloning nvim repository"
mkdir -p ~/.config

echo "Backup old nvim, if present"
[ -d "${HOME}/.config/nvim" ] && mv "$HOME"/.config/nvim "$HOME"/.config/nvim.bk_$RANDOM

git clone https://github.com/icadariu/nvim.git ~/.config/nvim

echo

if ! command -v git >/dev/null 2>&1; then
    echo "git not available. Press Enter to install it."
    read -r
    sudo apt install -y git
fi

if ! command -v nvim >/dev/null 2>&1; then
    echo "nvim not available. Press Enter to install it."
    read -r

    curl -Lso /tmp/nvim-linux64.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo tar -zxf /tmp/nvim-linux64.tar.gz -C /opt/
    # Add nvim to PATH if not present.
    grep -q "PATH=.*nvim-linux64" "${rcFile}" || echo "export PATH=\$PATH:/opt/nvim-linux64/bin" >> "${rcFile}"
fi

if ! command -v go >/dev/null 2>&1; then
    echo "go not available. Press Enter to install it."
    read -r

    sudo snap refresh
    sudo snap install go --classic
    sudo snap install ripgrep --classic
fi

echo "Installing other tools used by nvim setup"
sudo apt update && sudo apt install -y python3-pip python3-neo python3-yamlfix cargo luarocks fd-find xclip shellcheck


echo "This setup uses lazygit. I will now install lazygit if not present!"

if ! command -v go >/dev/null 2>&1; then
    echo "lazygit not available. I will install go using snap"

    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lso /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar -zxf /tmp/lazygit.tar.gz -C /tmp/
    sudo install /tmp/lazygit /usr/local/bin
fi

echo "Do you want to have node installed in your local folder? y/n "
read -r answer

if [[ ${answer} == 'y' ]]; then
    # Ref: https://johnpapa.net/node-and-npm-without-sudo/
    # https://nodejs.org/en/download/prebuilt-binaries
    node_version='v22.9.0'

    mkdir -p "$HOME"/tools && cd "$HOME"/tools || exit

    wget https://nodejs.org/dist/${node_version}/node-${node_version}-linux-x64.tar.xz
    # extract node to a custom directory, the directory should exist.
    tar xvf node-${node_version}-linux-x64.tar.xz --directory="$HOME"/tools

    # Add node to PATH if not present.
    grep -q "PATH=.*${node_version}" ~/.bashrc || echo "export PATH=${HOME}/tools/node-${node_version}-linux-x64/bin:\$PATH" >> "${rcFile}"

    export PATH=$PATH:"$HOME"/tools/node-${node_version}-linux-x64/bin

    mkdir -p "$HOME"/.npm-packages
    npm config set prefix "$HOME"/.npm-packages

    npm install neovim
else
    echo "Node installation skipped"
fi

echo "Make sure to source $rcFile before starting nvim"
