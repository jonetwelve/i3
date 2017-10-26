call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree',                                         " 文件树
Plug 'majutsushi/tagbar',          { 'on': 'TagbarToggle'}          " tagbar
Plug 'tpope/vim-markdown',         { 'for': 'markdown'}             " markdown
Plug 'bling/vim-airline'                                            " airline
""Plug 'kien/ctrlp.vim',                                              " 全能查找
Plug 'davidhalter/jedi-vim',       { 'for': 'python'}               " python 支持
Plug 'w0rp/ale'                                                     " 错误，警告显示
Plug 'jmcantrell/vim-virtualenv',  { 'for' : 'python'}              " python 虚拟环境
Plug 'Shougo/deoplete.nvim',       { 'do': ':UpdateRemotePlugins' } " 黑魔法补全
Plug 'zchee/deoplete-jedi'
Plug 'reedes/vim-lexical'                                           " 拼写检查
Plug 'vim-scripts/todo-vim'
Plug 'junegunn/vim-easy-align'
Plug 'sbdchd/neoformat'                                             " 自动格式化
Plug 'honza/vim-snippets'
Plug 'ddollar/nerdcommenter'                                        " 代码注释快捷键
Plug 'kshenoy/vim-signature'                                        " 位置标记
Plug 'kien/rainbow_parentheses.vim'                                 " 不同颜色区分括号匹配
Plug 'yggdroot/leaderf'                                             " 全能查找


call plug#end()
