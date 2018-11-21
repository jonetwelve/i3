au BufNewFile,BufRead *.wxml    setf xml
au BufNewFile,BufRead *.wxss    setf css

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               插件
call plug#begin('~/.config/nvim/plugged')
Plug 'majutsushi/tagbar',          { 'on': 'TagbarToggle'}          " tagbar
Plug 'bling/vim-airline'                                            " airline
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
Plug 'junegunn/fzf', { 'dir': '~/.config/nvim/tools', 
            \ 'do': './install --all' }                             " 多功能查找工具
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }		" 黑魔法补全
let g:deoplete#enable_at_startup = 1
Plug 'liuchengxu/vim-which-key'                                     " 底部现实快捷命令提示
Plug 'yggdroot/indentline'                                          " 缩进线显示
Plug 'jiangmiao/auto-pairs'                                         " 自动不全成对括号
Plug 'thinca/vim-quickrun'
" python"
Plug 'mgedmin/python-imports.vim', { 'do': './install.sh'}          " pytohn自动import
Plug 'heavenshell/vim-pydocstring'                                  " 自动生成代码文档
Plug 'python-mode/python-mode', { 'branch': 'develop' }
let g:pymode_python = 'python3'
" php
" format php file, need command:php-cs-fixer
Plug 'vim-scripts/PDV--phpDocumentor-for-Vim'                       " 自动生成代码文档
" js"
Plug 'mxw/vim-jsx'
Plug 'chemzqm/vim-jsx-improve'
" html"
Plug 'othree/html5.vim'                                             " h5支持n
" golang"
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               插件配置
"--------->
" quickrun
let g:quickrun_no_default_key_mappings=1

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
\'    |  +/-:选取模块                                                     |',
\'    |  mx:当前位置打标签x                                               |',
\"    |  'x:跳转到标签x                                                   |",
\'    |  m<Space>:删除所有标签                                            |',
\'    |  \c<space>:取消注释                                               |',
\'    |  \cc:单行注释                                                     |',
\'    |                                                                   |',
\'    *-------------------------------------------------------------------*',
\'       o',
\'        o   ^__^',
\'         o  (oo)\_______',
\'            (__)\       )\/\',
\'                ||----w |',
\'                ||     ||']

"--------->
" vim-which-key
let g:mapleader = "\<Space>"
let g:maplocalleader = ","
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
set timeoutlen=10
let g:which_key_map =  {}
" vim-which-key基本配置完毕
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
let g:which_key_map.b = { 'name':"buffer" }
let g:which_key_map.b.s = "switch buffer"
" fzf 搜索buffer
nnoremap <leader>bs :Buffers <cr>
let g:which_key_map.b.d = "Delete buffer"
nmap <leader>bd :bd<cr>
let g:which_key_map.s = {
            \ "name":"搜索",
            \ "f":"搜索files",
            \ "t":"搜索text",
            \ 's':"Ctrlsf搜索",
            \ 'n':"no搜索高亮"
            \ }
nnoremap <Leader>ss :CtrlSF 
nnoremap <leader>sn :nohl<cr>
" fzf搜索文件
nnoremap <leader>sf :Files<cr>      
" fzf 搜索文字
nnoremap <leader>st :Ag 
let g:which_key_map.c = {"name":"注释"}
let g:which_key_map.t = {
            \ "name":"代码",
            \ "c":"clean 空格",
            \ "i":"自动import",
            \ "r":"run",
            \ "f":"format",
            \ "d":"插入doc"
            \ }
nnoremap <Leader>tc :g/^\s*$/d<CR>
map <Leader>ti :call AutoImport()<CR>
map <Leader>tr :QuickRun<CR>
nmap <Leader>tf :call Jformater()<CR>
nmap <Leader>td :call InsertDoc()<CR>
let g:which_key_map.m = {
            \ "name":"标签",
            \ "t":"toggle标签",
            \ "l":"list标签"
            \ }
nmap <leader>mt m
nmap <leader>ml :SignatureListBufferMarks<cr>
let g:which_key_map.x = {
            \ "name":"tools",
            \ "w":"workers need todo",
            \ "t":"tagbar"
            \ }
nmap <leader>xw :TODOToggle<CR>
nmap <leader>xt :TagbarToggle<CR>
call which_key#register('<Space>', "g:which_key_map")

"--------->
" deoplete
let g:deoplete#enable_at_startup = 1

"--------->
" pymode
let g:pymode_run = 0
let g:pymode_breakpoint = 0

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
autocmd bufnewfile *.py call HeaderOfPython()
func! HeaderOfPython()
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
autocmd bufnewfile *.php call HeaderOfPHP()
func! HeaderOfPHP()
    call setline(1, "<?php")
    normal G
    normal o
    normal o
endf

"--------->
" 按F4自动import
func! AutoImport()
    if &filetype == 'python'
        exec "ImportName"
    elseif &filetype == 'php'
        call PhpExpandClass()
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
au BufNewFile,BufRead *.py
\ set tabstop=4   "tab宽度
\ set softtabstop=4
\ set shiftwidth=4
\ set textwidth=79  "行最大宽度
\ set expandtab       "tab替换为空格键
\ set autoindent      "自动缩进
\ set fileformat=unix   "保存文件格式
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
"--------->
" 切换打开的窗口"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"--------->
" copy to system clipboard
vnoremap <C-y> "+y
