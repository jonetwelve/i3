call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree',                                         " 文件树
Plug 'xuyuanp/nerdtree-git-plugin'                                  " nerdtree git显示
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar',          { 'on': 'TagbarToggle'}          " tagbar
Plug 'bling/vim-airline'                                            " airline
Plug 'junegunn/vim-easy-align'										" 代码对其
Plug 'sbdchd/neoformat'                                             " 自动格式化,js:pip install jsbeautifier,
Plug 'kien/rainbow_parentheses.vim'                                 " 不同颜色区分括号匹配
Plug 'yggdroot/leaderf'                                             " 全能查找,需要命令the_platinum_searcher
Plug 'yggdroot/indentline'                                          " 缩进线显示
Plug 'morhetz/gruvbox'                                              " 黑色主题
Plug 'terryma/vim-expand-region'                                    " +,_快捷键选择区域块
Plug 'ervandew/supertab'											" tab键增强
Plug 'airblade/vim-gitgutter'										" git支持
Plug 'w0rp/ale'                                                     " 语法检查
Plug 'scrooloose/nerdcommenter'										" 注释快捷键
Plug 'kshenoy/vim-signature'										" 标记跳转点
Plug 'shougo/neocomplete.vim'                                       " 拼写检查
" markdown"
Plug 'tpope/vim-markdown',         { 'for': 'markdown'}             " markdown
" python"
Plug 'davidhalter/jedi-vim',       { 'for': 'python'}               " python 支持, yapf
Plug 'jmcantrell/vim-virtualenv',  { 'for' : 'python'}              " python 虚拟环境
Plug 'roxma/nvim-completion-manager'								" 自动弹出代码提示,依赖:pip3 install jedi psutil setproctitle isort
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
Plug 'rstacruz/sparkup'


call plug#end()
