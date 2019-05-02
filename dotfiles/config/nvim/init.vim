scriptencoding utf-8

let g:CusVim = {}
let g:CusVim.root = '/home/jone/.config/nvim'
let g:CusVim.cache_dir = '/home/jone/.cache/nvim'
let g:CusVim.info = g:CusVim.cache_dir . '/info.vim'
let g:CusVim.pkg_dir = g:CusVim.root . '/pkgs'


let g:CusVim.excluded = ["python", "go", "tagbar"]
let g:CusVim.user_configs = []


set runtimepath+=/home/jone/.config/nvim/core

call CusVim#bootstrap()
