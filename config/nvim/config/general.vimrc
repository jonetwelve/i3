syntax on
syntax enable
filetype plugin on
let mapleader="\<space>"
set number                            " 显示行号
set hls                               " 搜索高亮
set ic                                " 搜索忽略大小写"
set autoindent                        " 设置自动缩进"
set tabstop=4                         " tag长度"
set softtabstop=4                     " 用空格代替tab"
set shiftwidth=4
autocmd FileType python set expandtab " 在python文件用空格代替tab
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


hi SignColumn guibg=grey guifg=red

"""""""记录光标位置
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

"""""""备份相关
set undodir=~/.config/nvim/undodir
set undofile
set undolevels=100
set undoreload=1000

set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/backup
"""""""

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


set hid                 " buffer cecomes hidden when abandoned
