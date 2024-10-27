# Config created out of 💤 LazyVim

* Generated using the starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
* To get started, check [lazyvim installation](https://lazyvim.github.io/installation).

* Plugins installed by default can be checked [here](https://www.lazyvim.org/plugins).
  * More info [here](https://lazy.folke.io/spec) and [here](http://www.lazyvim.org/configuration/plugins)

* Kemaps available:
  * Default keymaps - [check this](https://www.lazyvim.org/keymaps#general).
  * Mine - [docs folder](/docs/Good_to_know.md) for different tips & tricks!

## Installation

* :warning:These steps were tested on Ubuntu only.

* Clone this repo

  ```sh
  mkdir -p ~/.config
  git clone https://github.com/icadariu/nvim.git ~/.config/nvim
  ```

* Execute `/scripts/install.sh`

* Install Neovim

  ```sh
  curl -Lso /tmp/nvim-linux64.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
  sudo tar -zxf /tmp/nvim-linux64.tar.gz -C /opt/

  export PATH=$PATH:/opt/nvim-linux64/bin
  ```

* Packages

  ```sh
  # Installing go (used by gopls)
  sudo snap refresh
  sudo snap install go --classic

  sudo apt install -y python3-pip python3-neo python3-yamlfix ripgrep cargo luarocks fd-find xclip

  # Install lazygit
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  curl -Lso /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar -zxf /tmp/lazygit.tar.gz -C /tmp/
  sudo install /tmp/lazygit /usr/local/bin
  ```

* Having Node installed in $HOME is a nice feature, but not really required

  ```sh
  # Ref: https://johnpapa.net/node-and-npm-without-sudo/
  # https://nodejs.org/en/download/prebuilt-binaries
  node_version='v22.9.0'

  mkdir -p $HOME/tools && cd $HOME/tools

  wget https://nodejs.org/dist/${node_version}/node-${node_version}-linux-x64.tar.xz
  # extract node to a custom directory, the directory should exist.
  tar xvf node-${node_version}-linux-x64.tar.xz --directory=$HOME/tools

  # add node path in .zshrc
  export PATH="$HOME/tools/node-${node_version}-linux-x64/bin:$PATH"

  mkdir -p $HOME/.npm-packages
  npm config set prefix ~/.npm-packages

  npm install neovim
  ```

* Start Neovim and check health

  ```sh
  nvim
  # check helalth once plugins are installed
  :checkhealth
  # To view potential errors, use
  :NoiceErrors
  ```
