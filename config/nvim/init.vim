au BufNewFile,BufRead *.wxml    setf xml
au BufNewFile,BufRead *.wxss    setf css

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               插件
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
Plug 'chemzqm/vim-jsx-improve'
" html"
Plug 'othree/html5.vim'                                             " h5支持n
Plug 'mattn/emmet-vim'
" golang"
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               插件配置

"--------->
" airline
let g:airline_powerline_fonts                    = 1
let g:airline#extensions#tabline#enabled         = 1
let g:airline#extensions#tabline#left_sep        = ''
let g:airline#extensions#tabline#left_alt_sep    = '|'
let g:airline#extensions#tabline#tab_nr_type     = 1
set laststatus                                   =2
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#syntastic#enabled       = 1
let g:airline#extensions#quickfix#quickfix_text  = 'QF'
let g:airline#extensions#quickfix#location_text  = 'LL'
" disable unused extensions (performance)
let g:airline#extensions#bufferline#enabled      = 0
let g:airline#extensions#capslock#enabled        = 0
let g:airline#extensions#csv#enabled             = 0
let g:airline#extensions#ctrlspace#enabled       = 0
let g:airline#extensions#eclim#enabled           = 0
let g:airline#extensions#hunks#enabled           = 0
let g:airline#extensions#nrrwrgn#enabled         = 0
let g:airline#extensions#promptline#enabled      = 0
let g:airline#extensions#taboo#enabled           = 0
let g:airline#extensions#tagbar#enabled          = 0
let g:airline#extensions#virtualenv#enabled      = 0
let g:airline#extensions#whitespace#enabled      = 0

"--------->
" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0  "打开vim时不再询问是否加载ycm_extra_conf.py配置
set completeopt=longest,menu
let g:ycm_seed_identifiers_with_syntax = 1 "自动开启语义补全
let g:ycm_complete_in_comments = 1  "在注释中也开启补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_complete_in_strings = 1 "字符串中也开启补全
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_tags_files = 1 "开启基于tag的补全，可以在这之后添加需要的标签路径  
let g:ycm_min_num_of_chars_for_completion = 2 "开始补全的字符数
let g:ycm_autoclose_preview_window_after_completion = 1 "补全后自动关闭预览窗口
let g:ycm_cache_omnifunc=0 "禁止缓存匹配项,每次都重新生成匹配项
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
let g:ycm_seed_identifiers_with_syntax = 1   "语法关键字补全
let g:ycm_use_ultisnips_completer = 1  "整合UltiSnips的提示
let g:ycm_goto_buffer_command = 'horizontal-split' "在实现和声明之间跳转,并分屏打开
nnoremap <Leader>g :YcmCompleter GoTo<CR>
let g:ycm_show_diagnostics_ui = 0 "与syntastic有冲突，建议关闭
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0

"--------->
" nerdtree
let NERDTreeIgnore=['.*\.pyc', '__pycache__']
let g:nerdtree_tabs_open_on_console_startup=0
let NERDTreeShowBookmarks=1

"--------->
" ale
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '◐'
hi clear ALEErrorSign
hi clear ALEWarningSign

"--------->
" rainbow_parentheses
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"--------->
" neoformat
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_enabled_python = ['yapf']
let g:neoformat_python_yapf= {'exe': 'yapf',
            \'args':
                \["--style '{
                    \column_limit:140,
                    \based_on_style:pep8,
                    \spaces_before_comment:4,
                    \split_before_logical_operator: True,
                    \align_closing_bracket_with_visual_indent: False,
                    \blank_line_before_class_docstring:False,
                    \dedent_closing_brackets: True,
                    \indent_dictionary_value: True
                \}'"],
            \'stdin': 1
            \}

"--------->
" indentline 缩进指示线
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

"--------->
" gruvbox
colorscheme onedark
set background=dark

"--------->
" phpcomplete
let g:phpcomplete_relax_static_constraint = 1
let g:phpcomplete_complete_for_unknown_classes = 1
let g:phpcomplete_search_tags_for_variables = 1
let g:phpcomplete_parse_docblock_comments = 1

"--------->
" startify
"起始页显示的列表长度
let g:startify_files_number = 5
"自动加载session
let g:startify_session_autoload = 1
let g:startify_padding_left = 11
"自定义Header和Footer
let g:startify_custom_header = ['    *-------------------------------------------------------------------*',
\'    |  F2:去除空行                             +/-:选取模块             |',
\'    |  F4:自动import                           mx:当前位置打标签x       |',
\"    |  F7:TODOToggle                           'x:跳转到标签x           |",
\'    |  F8:Tagbar                               m<Space>:删除所有标签    |',
\'    |  F9:插入注释文档                         \c<space>:取消注释       |',
\'    |  <leader>ss:文件夹里查找                 \cc:单行注释             |',
\'    |  <c-y>,:emmet补全                        \cs:块注释               |',
\'    *-------------------------------------------------------------------*',
\'       o',
\'        o   ^__^',
\'         o  (oo)\_______',
\'            (__)\       )\/\',
\'                ||----w |',
\'                ||     ||']

"--------->
" deoplete
let g:deoplete#enable_at_startup = 1

"--------->
" jedi"
let g:jedi#completions_enabled    = 1
let g:jedi#auto_initialization    = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#use_tabs_not_buffers   = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               自定义方法
"--------->
"新建.py文件，自动插入文件头
autocmd bufnewfile *.py call HeaderPython()
function HeaderPython()
    call setline(1, "#!/usr/bin/env python")
    call append(1, "# -*- coding: utf-8 -*-")
    call append(2, "")
	call append(3,"# File Name: ".expand("%"))
    normal G
    normal o
    normal o
endf
"--------->
"新建.php文件，自动插入文件头
autocmd bufnewfile *.php call HeaderPHP()
function HeaderPHP()
    call setline(1, "<?php")
    normal G
    normal o
    normal o
endf

"--------->
" 按F4自动impor
func! AutoImport()
    if &filetype == 'python'
        exec "ImportName"
    elseif &filetype == 'php'
        call PhpExpandClass()
    endif
endfunc

"--------->
" 按F5编译运行
func! RunScript()
    exec "w"
    if &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'php'
        exec "!php %"
    elseif &filetype == 'go'
        exec "!time go run %"
    endif
endfunc

"--------->
" 按F6格式化代码
func! Jformater()
    if &filetype == 'html'
        exec "Neoformat! html js-beautify"
    else
        exec "Neoformat"
    endif

	exec "w"
endfunc

"--------->
" 按F9插入方法注释
func! InsertDoc()
    if &filetype == 'python'
        exec "Pydocstring"
    elseif &filetype == 'php'
        call PhpDocSingle()
    endif

endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               通用配置
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
"自动、智能缩进
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
autocmd BufRead *.* setlocal ts=4 sts=4 sw=4 expandtab
filetype indent on
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
hi SignColumn guibg=grey guifg=red
set hid                               " buffer cecomes hidden when abandoned

"--------->
"记录光标位置
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

"--------->
"备份相关
set undodir=~/.config/nvim/undodir
set undofile
set undolevels=100
set undoreload=1000

set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/backup

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               快捷键
nnoremap <Leader>w :w<cr>
nnoremap <Leader>q :q<cr>

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

"--------->
"去空行
nnoremap <F2> :g/^\s*$/d<CR>

"--------->
" NERDT
map <F3> <ESC>:NERDTreeMirror<CR>
map <F3> <ESC>:NERDTreeToggle<CR>

"--------->
" 自动import
map <F4> :call AutoImport()<CR>

"--------->
" 运行代码
map <F5> :call RunScript()<CR>

"--------->
"--------->
" neoformat,格式化代码
nmap <F6> :call Jformater()<CR>
""nmap <F6> :Neoformat<CR>

"--------->
"todo
nmap <F7> :TODOToggle<CR>

"--------->
" tagbar"
nmap <F8> :TagbarToggle<CR>

"--------->
" insert doc"
nmap <F9> :call InsertDoc()<CR>

"--------->
" airline
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

"--------->
" 切换打开的窗口"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"--------->
" tab"
imap <silent><C-n> <ESC><ESC>:tabnew<cr>
nmap <silent><C-n> <ESC><ESC>:tabnew<cr>
imap <silent><C-w> <ESC><ESC>:tabc!<cr>
nmap <silent><C-w> <ESC><ESC>:tabc!<cr>
""nmap <silent><tab> <ESC><ESC>:bn<CR>

"--------->
" copy to system clipboard
vnoremap <C-y> "+y

"--------->
" 查找插件
nnoremap <Leader>ss :CtrlSF

"--------->
" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
