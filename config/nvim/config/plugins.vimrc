call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree',                                         " 文件树
Plug 'majutsushi/tagbar',          { 'on': 'TagbarToggle'}          " tagbar
Plug 'tpope/vim-markdown',         { 'for': 'markdown'}             " markdown
Plug 'bling/vim-airline'                                            " airline
Plug 'davidhalter/jedi-vim',       { 'for': 'python'}               " python 支持
Plug 'w0rp/ale'                                                     " 错误，警告显示
Plug 'jmcantrell/vim-virtualenv',  { 'for' : 'python'}              " python 虚拟环境
Plug 'Shougo/deoplete.nvim',       { 'do': ':UpdateRemotePlugins' } " 黑魔法补全
Plug 'ervandew/supertab'                                            " tab键自动补全
Plug 'zchee/deoplete-jedi'
Plug 'reedes/vim-lexical'                                           " 拼写检查
Plug 'vim-scripts/todo-vim'
Plug 'junegunn/vim-easy-align'
Plug 'sbdchd/neoformat'                                             " 自动格式化
Plug 'honza/vim-snippets'
Plug 'ddollar/nerdcommenter'                                        " 代码注释快捷键
Plug 'kshenoy/vim-signature'                                        " 位置标记
Plug 'kien/rainbow_parentheses.vim'                                 " 不同颜色区分括号匹配
Plug 'yggdroot/leaderf'                                             " 全能查找,需要命令the_platinum_searcher
Plug 'mgedmin/python-imports.vim',  {'do': './install.sh'}          " pytohn自动import
Plug 'arnaud-lb/vim-php-namespace'                                  " php自动import
Plug 'stanangeloff/php.vim'                                         " php支持
Plug 'yggdroot/indentline'                                          " 缩进线显示
Plug 'dyng/ctrlsf.vim'                                              " ctrl+shift+f sublime
Plug 'morhetz/gruvbox'                                              " 黑色主题
Plug 'shougo/neocomplete.vim'                                       " auto complete
Plug 'terryma/vim-expand-region'                                    " +,_快捷键选择区域块


call plug#end()
