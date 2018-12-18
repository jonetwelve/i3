#!/bin/bash

# 安装vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim
    \ --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


sudo pip install python-language-server
go get github.com/sourcegraph/go-langserver
sudo npm i -g bash-language-server

# 安装coc
xdg-open 'https://github.com/neoclide/coc.nvim'
xdg-open 'https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions'
xdg-open "https://github.com/neoclide/coc.nvim/wiki/Language-servers"
xdg-open 'https://github.com/neoclide/coc-sources'
xdg-open 'https://github.com/neoclide/coc-json'
xdg-open 'https://github.com/neoclide/coc-tsserver'
xdg-open 'https://github.com/neoclide/coc-html'
xdg-open 'https://github.com/neoclide/coc-css'
xdg-open 'https://github.com/neoclide/coc-vetur'
xdg-open 'https://github.com/neoclide/coc-pyls'
xdg-open 'https://github.com/neoclide/coc-emmet'
xdg-open 'https://github.com/natebosch/dart_language_server'
xdg-open 'https://github.com/sourcegraph/go-langserver'
xdg-open 'https://github.com/mads-hartmann/bash-language-server'
