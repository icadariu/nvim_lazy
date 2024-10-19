# Config created out of 💤 LazyVim

* Generated using the starter template for [LazyVim](https://github.com/LazyVim/LazyVim). Check [documentation](https://lazyvim.github.io/installation) to get started.

* For the list of default installed plugins check [this](https://www.lazyvim.org/plugins). Check the following to tweak your config:
* [Keymaps section](https://www.lazyvim.org/keymaps#general) for more.
* For info about Plugins, check [this](https://lazy.folke.io/spec) and [this](http://www.lazyvim.org/configuration/plugins)

## installation

* Packages:

  ```sh
  sudo apt install ripgrep python3-neo cargo python3-yamlfix

  ```

* Having Node installed in $HOME is a nice feature, but not really required

  ```bash
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
  ```
