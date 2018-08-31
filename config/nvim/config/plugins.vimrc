call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree',                                         " 文件树
Plug 'majutsushi/tagbar',          { 'on': 'TagbarToggle'}          " tagbar
Plug 'bling/vim-airline'                                            " airline
Plug 'junegunn/vim-easy-align'										" 代码对其
Plug 'sbdchd/neoformat'                                             " 自动格式化,js:pip install jsbeautifier,
Plug 'kien/rainbow_parentheses.vim'                                 " 不同颜色区分括号匹配
Plug 'dyng/ctrlsf.vim'												" 文件夹下查找字符
Plug 'joshdick/onedark.vim'                                         " 黑色主题
Plug 'terryma/vim-expand-region'                                    " +,_快捷键选择区域块
Plug 'w0rp/ale'                                                     " 语法检查,在左边栏显示警告和错误
Plug 'scrooloose/nerdcommenter'										" 注释快捷键
Plug 'kshenoy/vim-signature'										" 标记跳转点
Plug 'mhinz/vim-startify'											" 启动界面修改
Plug 'vim-scripts/todo-vim'										    " todo
Plug 'kien/ctrlp.vim'												" 查找并打开文件
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }		" 黑魔法补全
let g:deoplete#enable_at_startup = 1
" python"
Plug 'davidhalter/jedi-vim'
Plug 'jmcantrell/vim-virtualenv',  { 'for' : 'python'}              " python 虚拟环境
Plug 'mgedmin/python-imports.vim', { 'do': './install.sh'}          " pytohn自动import
Plug 'heavenshell/vim-pydocstring'                                  " 自动生成代码文档
" php
" format php file, need command:php-cs-fixer
Plug 'vim-scripts/PDV--phpDocumentor-for-Vim'                       " 自动生成代码文档
" js"
Plug 'mxw/vim-jsx'
Plug 'isruslan/vim-es6'
Plug 'chemzqm/vim-jsx-improve'
" html"
Plug 'othree/html5.vim'                                             " h5支持n
Plug 'mattn/emmet-vim'
" golang"
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


call plug#end()
