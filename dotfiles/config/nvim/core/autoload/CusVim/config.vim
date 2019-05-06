let mapleader="\<space>"

" 空格缩进
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set smarttab
set smartindent

syntax on
syntax enable
filetype indent on
filetype plugin on

set backspace=indent,eol,start
set number                            " 显示行号
set relativenumber                    " 相对行号
set hlsearch                          " 搜索高亮
set ignorecase                        " 搜索忽略大小写"
set smartcase      " ... but case sensitive when uc present
set encoding=utf-8
set bsdir=buffer                      " 文件浏览目录为当前目录"
set autoread                          " 文件被修改后自动加载"
set nowrap                            " 关闭自动换行"
set clipboard=unnamed                 " 支持系统剪切板"
set mouse=a                           " 设置可以使用鼠标变化窗口大小"
set mousehide      " Hide the mouse cursor while ty
set scrolloff=3                       " 光标移动到buffer的顶部和底部时保持3行距离
set completeopt=preview,menu          " 代码补全
set autowrite                         " 自动保存
set termguicolors
set showcmd                           " display incomplete commands
set cursorline                        " cursorcolumn
set foldmethod=indent                 " 默认展开所有代码
set foldlevelstart=99
set fileencodings=utf-8,chinese       " 中文乱码
set splitright     " Puts new vsplit windows to the right of the current
set splitbelow     " Puts new split windows to the bottom of the curren

""let g:python3_host_prog = '/usr/bin/python3'

hi SignColumn ctermbg=NONE guibg=NONE       " sign bar不显示背景

"--------->
"记录光标位置
augroup resCur
	autocmd!
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

"--------->
"备份相关
set undodir=~/.cache/nvim/undodir
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


"--------->
" 切换打开的窗口"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"--------->
" 复制内容到系统剪切板
vnoremap <C-y> "+y

"" 移动代码块
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv