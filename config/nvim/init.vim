"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 全局配置"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off            " 侦测文件类型
syntax on
let mapleader="\<space>"
set number
set hls is              " 搜索高亮"
set ic                  " 搜索忽略大小写"
set autoindent          " 设置自动缩进"
set tabstop=4           " tag长度"
set softtabstop=4       " 用空格代替tab"
set cursorline          " 高亮显示当前行"
set cursorcolumn        " 高亮显示当前列"
set t_Co=256            " 设置终端支持的颜色是256颜色，这样才支持高亮当前行"
set bsdir=buffer        " 文件浏览目录为当前目录"
set autoread            " 文件被修改后自动加载"
set nowrap              " 关闭自动换行"
set shiftwidth=4
set encoding=utf-8
set clipboard=unnamed   " 支持系统剪切板"
set mouse=a             " 设置可以使用鼠标变化窗口大小"
set scrolloff=3         " 光标移动到buffer的顶部和底部时保持3行距离 
set completeopt=preview,menu       "代码补全 
set autowrite           "自动保存
set relativenumber
set noswapfile
set nobackup
set nowritebackup
set lcs=tab:\┆\ 
set list
" 配色方案
colo slate
" 设置当前行背景色"
hi CursorLine cterm=NONE ctermbg=236 guibg=#222222
" 设置当前列背景色"
hi CursorColumn cterm=NONE ctermbg=236 guibg=#222222
" 记录光标位置
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'						" 文件树
Plug 'majutsushi/tagbar'						" tagbar
Plug 'tpope/vim-markdown'						" markdown
Plug 'tpope/vim-fugitive'						" git 插件
Plug 'honza/vim-snippets'						" 自动补全
Plug 'bling/vim-airline'						" airline
Plug 'kien/ctrlp.vim'							" 全能查找
Plug 'davidhalter/jedi-vim'						" python 支持
Plug 'shougo/neocomplete.vim'					" 自动提示
Plug 'scrooloose/syntastic'						" 错误，警告显示
Plug 'garbas/vim-snipmate'                      " 错误，警告显示相关插件
Plug 'marcweber/vim-addon-mw-utils'             " 错误，警告显示相关插件
Plug 'tomtom/tlib_vim'                          " 错误，警告显示相关插件
Plug 'jmcantrell/vim-virtualenv'				" python 虚拟环境
call plug#end()
"""""""""插件配置
" NERDT
map <F3> <ESC>:NERDTreeMirror<CR>
map <F3> <ESC>:NERDTreeToggle<CR>
let NERDTreeIgnore=['.*\.pyc', '__pycache__']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" tagbar"
nmap <F8> :TagbarToggle<CR>
" markdown"
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_syntax_conceal = 0
" snippets"
let g:snippets_dir="~/.config/nvim/plugged/vim-snippets/snippets"
" jedi"
let g:jedi#completions_enabled = 1
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#use_tabs_not_buffers = 1
" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#tab_nr_type = 1
set laststatus=2
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
" neocomplete
let g:neocomplete#enable_at_startup = 1
" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol="\u2717"
let g:syntastic_warning_symbol="\u26A0"
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1
let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_html_checkers=['tidy', 'jshint']
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5
func! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        Errors
    endif
endfunction
nnoremap <Leader>s :call ToggleErrors()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"自定义快捷键
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动补全"
imap <C-a> <C-x><C-o>
"去空行  
nnoremap <F2> :g/^\s*$/d<CR> 
" tab"
imap <silent><C-n> <ESC><ESC>:tabnew<cr>
nmap <silent><C-n> <ESC><ESC>:tabnew<cr>
imap <silent><C-w> <ESC><ESC>:tabc!<cr>
nmap <silent><tab> <ESC><ESC>:tabnext<CR>
nmap <C-j> <C-w>j
imap <silent><C-j> <ESC><C-w> j
nmap <C-k> <C-w>k
imap <silent><C-k> <ESC><C-w> k
nmap <C-l> <C-w>l
imap <silent><C-l> <ESC><C-w> l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新文件标题
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.py文件，自动插入文件头 
autocmd BufNewFile *.php,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func! SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'php' 
        call setline(1,"<?php") 
        call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "") 
        call append(line(".")+1, "") 
        call append(line(".")+1, "") 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "  > Author: ") 
        call append(line(".")+2, "  > Mail: ") 
        call append(line(".")+3, "  > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    "新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按F5编译运行
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    endif
endfunc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"代码格式优化化
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F6> :call FormartSrc()<CR><CR>
func! FormartSrc()
    exec "w"
    if &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    endif
    exec "e! %"
endfunc
