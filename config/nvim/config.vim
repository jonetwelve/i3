colorscheme onedark
set background=dark

syntax on
syntax enable
filetype indent on
filetype plugin on
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
hi SignColumn guibg=grey guifg=red
let mapleader="\<space>"
set backspace=indent,eol,start
set number                            " 显示行号
set hls                               " 搜索高亮
set ic                                " 搜索忽略大小写"
set fileformat=unix
set smarttab
set smartindent
set bsdir=buffer                      " 文件浏览目录为当前目录"
set autoread                          " 文件被修改后自动加载"
set nowrap                            " 关闭自动换行"
set encoding=utf-8
set clipboard=unnamed                 " 支持系统剪切板"
set mouse=a                           " 设置可以使用鼠标变化窗口大小"
set scrolloff=3                       " 光标移动到buffer的顶部和底部时保持3行距离
set completeopt=preview,menu          " 代码补全
set autowrite                         " 自动保存
set termguicolors
set showcmd                           " display incomplete commands
set cursorline                        " cursorcolumn
set cc=140
set foldmethod=indent                 " 默认展开所有代码
set foldlevelstart=99
set fileencodings=utf-8,chinese       " 中文乱码
set hid                               " buffer cecomes hidden when abandoned

"--------->
"记录光标位置
augroup resCur
	autocmd!
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

"--------->
"备份相关
set undodir=~/.cache/vim_undodir
set undofile
set undolevels=100
set undoreload=1000

"--------->
" backup
set nobackup
set nowritebackup
set noswapfile

set so=5                " scroll lines above/below cursor
set sidescrolloff=5
set lazyredraw

set magic               " for regular expressions

if &history < 1000
	set history=1000
endif
if &tabpagemax < 50
	set tabpagemax=50
endif
if !empty(&viminfo)
	set viminfo^=!
endif
set sessionoptions-=options
