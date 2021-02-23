#!/usr/bin/env bash

# Install virtualenv to containerize dependencies
python3 -m venv .config/nvim/env

# Install pip modules for Neovim within the virtual environment created
source .config/nvim/env/bin/activate
pip install -r requirements.txt
deactivate

# Enter Neovim and install plugins using a temporary init.vim, which avoids
# warnings about missing colorschemes, functions, etc
mv .config/nvim/init.vim .config/nvim/init.vim.backup
sed '/call plug#end/q' init.vim > .config/nvim/init.vim
nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'
rm .config/nvim/init.vim
mv .config/nvim/init.vim.backup .config/nvim/init.vim
