call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'						" 文件树
Plug 'majutsushi/tagbar'						" tagbar
Plug 'tpope/vim-markdown'						" markdown
Plug 'bling/vim-airline'						" airline
Plug 'kien/ctrlp.vim'							" 全能查找
Plug 'davidhalter/jedi-vim'						" python 支持
Plug 'scrooloose/syntastic'						" 错误，警告显示
Plug 'garbas/vim-snipmate'                      " 错误，警告显示相关插件
Plug 'marcweber/vim-addon-mw-utils'             " 错误，警告显示相关插件
Plug 'tomtom/tlib_vim'                          " 错误，警告显示相关插件
Plug 'jmcantrell/vim-virtualenv'				" python 虚拟环境
Plug 'vimwiki/vimwiki'                          " 临时笔记本
Plug 'shougo/deoplete.nvim'                     " 黑魔法补全
Plug 'zchee/deoplete-jedi'                      " 黑魔法补全python 
call plug#end()
