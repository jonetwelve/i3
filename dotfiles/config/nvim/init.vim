scriptencoding utf-8

let g:CusVim = {}
let g:CusVim.root = expand('~/.config/nvim')
let g:CusVim.cache_dir = expand('~/.cache/nvim')
let g:CusVim.info = g:CusVim.cache_dir . '/info.vim'
let g:CusVim.pkg_dir = g:CusVim.root . '/pkgs'


let g:CusVim.excluded = []
let g:CusVim.user_configs = []


set runtimepath+=~/.config/nvim/core

call CusVim#bootstrap()
