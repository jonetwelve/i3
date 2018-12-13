"*****************************************************************************
"" Vim-PLug 安装
"*****************************************************************************
let vimplug_exists=expand('~/.local/share/nvim/site/autoload/plug.vim')
if !filereadable(vimplug_exists)
	if !executable("curl")
		echoerr "You have to install curl or first install vim-plug yourself!"
		execute "q!"
	endif
	echo "Installing Vim-Plug..."
	echo ""
	silent !\curl -fLo ~/.local/share/nvim/site/autoload/plug.vim
				\ --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif


"*****************************************************************************
"" 插件列表
"*****************************************************************************
call plug#begin('~/.config/nvim/plugged')

Plug 'duff/vim-trailing-whitespace'
Plug 'majutsushi/tagbar',          { 'on': 'TagbarToggle'}          " tagbar
Plug 'bling/vim-airline'                                            " airline
Plug 'chiel92/vim-autoformat'                                       " 自动格式化
Plug 'kien/rainbow_parentheses.vim'                                 " 不同颜色区分括号匹配
Plug 'dyng/ctrlsf.vim'                                              " 文件夹下查找字符
Plug 'joshdick/onedark.vim'                                         " 黑色主题
Plug 'terryma/vim-expand-region'                                    " +,_快捷键选择区域块
Plug 'w0rp/ale'                                                     " 语法检查,在左边栏显示警告和错误
Plug 'scrooloose/nerdcommenter'                                     " 注释快捷键
Plug 'kshenoy/vim-signature'										" 标记跳转点
Plug 'mhinz/vim-startify'                                           " 启动界面修改
Plug 'vim-scripts/todo-vim'											" todo
Plug 'junegunn/fzf', { 'dir': '~/.config/nvim/tools',
			\ 'do': './install --all' }                             " 多功能查找工具
Plug 'junegunn/fzf.vim'                                             " 全能查找工具
Plug 'liuchengxu/vim-which-key'                                     " 底部现实快捷命令提示
Plug 'yggdroot/indentline'                                          " 缩进线显示
Plug 'thinca/vim-quickrun'                                          " 运行代码
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }       " 只能补全工具
Plug 'sirver/ultisnips'                                             " 代码块补全
Plug 'honza/vim-snippets'                                           " 代码块补全
Plug 'Shougo/denite.nvim'                                           " 额外命令
Plug 'scrooloose/nerdtree'                                          " 文件树

" python"
Plug 'mgedmin/python-imports.vim', { 'do': './install.sh'}          " pytohn自动import
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'davidhalter/jedi-vim'                                         " python 支持
Plug 'zchee/deoplete-jedi'

" php
Plug 'shawncplus/phpcomplete.vim'
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'kristijanhusak/deoplete-phpactor'

" js"
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim'
Plug 'marijnh/tern_for_vim', {'do': 'npm install'}
Plug 'posva/vim-vue'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" html"
Plug 'othree/html5.vim'                                             " h5支持
Plug 'gorodinskiy/vim-coloresque'                                   " 颜色显示

" golang"
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

call plug#end()


"*****************************************************************************
"" 基础设置
"*****************************************************************************"
syntax on
syntax enable
filetype indent on
filetype plugin on
au BufNewFile,BufRead *.wxml    setf xml
au BufNewFile,BufRead *.wxss    setf css
"自动、智能缩进
autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 autoindent expandtab
autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2 autoindent expandtab
autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2 autoindent expandtab
autocmd BufNewFile,BufRead *.vue setlocal tabstop=2 softtabstop=2 shiftwidth=2 autoindent expandtab
autocmd BufNewFile,BufRead *.* setlocal tabstop=4 softtabstop=4 shiftwidth=4 autoindent
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


"*****************************************************************************
"" 插件配置
"*****************************************************************************"
"--------->
" deoplete-jedi
let g:deoplete#sources#jedi#show_docstring = 1

"--------->
" deoplete-ternjs
let g:deoplete#sources#ternjs#tern_bin = '/usr/bin/tern'
let g:deoplete#sources#ternjs#timeout = 1
let g:deoplete#sources#ternjs#include_keywords = 1
let g:deoplete#sources#ternjs#filetypes = [
			\ 'jsx',
			\ 'javascript.jsx',
			\ 'vue'
			\ ]
"--------->
" vim-vue
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
"--------->
" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"--------->
" deoplete
let g:deoplete#enable_at_startup = 1

"--------->
" quickrun
let g:quickrun_no_default_key_mappings=1

"--------->
" javascript-libraries-syntax
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_vue = 1

"--------->
" vim-go
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:syntastic_go_checkers = ['golint', 'govet']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

"--------->
" airline
let g:airline_powerline_fonts                    = 1
let g:airline#extensions#tabline#enabled         = 1
let g:airline#extensions#tabline#left_sep        = ''
let g:airline#extensions#tabline#left_alt_sep    = '|'
let g:airline#extensions#tabline#tab_nr_type     = 1
set laststatus                                   =2
let g:airline#extensions#tabline#buffer_idx_mode = 1

"--------->
" ale
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '◐'
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'vue': ['eslint', 'vls']}

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
" autoformat
let g:autoformat_autoindent = 1
let g:autoformat_retab = 1

"--------->
" indentline 缩进指示线
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

"--------->
" theme
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
let g:startify_custom_header = [
			\'    *-------------------------------------------------------------------*',
			\'    |  +/-:选取模块                                                     |',
			\"    |  'x:跳转到标签x                                                   |",
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
autocmd  FileType which_key set laststatus=0 noruler
			\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:which_key_map.b = {
			\ 'name':"buffer",
			\ "d":"delte 当前buffer",
			\ "o":"关闭other",
			\ "s":"switch buffer"
			\ }
" fzf 搜索buffer
nnoremap <leader>bd :bd!<cr>
nnoremap <leader>bo :.+1,$bw<cr>:1,.-1bw<cr><cr>
nnoremap <leader>bs :Buffers <cr>

let g:which_key_map.c = {"name":"注释"}

let g:which_key_map.d = {
			\ "name":"Denite",
			\ "c":"change",
			\ "d":"direcotry",
			\ "m":"map"
			\ }
nmap <leader>dc :Denite change<cr>
nmap <leader>dd :Denite directory_rec<cr>
nmap <leader>dm :Denite mapping<cr>

let g:which_key_map.d.f = {
			\ "name":"file",
			\ "l":"list",
			\ "n":"new"
			\ }
nmap <leader>dfl :Denite file buffer<cr>
nmap <leader>dfn :Denite file:new<cr>

let g:which_key_map.f = {
			\ "name":"文件",
			\ "l":"list"
			\ }
nnoremap <leader>fl :Denite file buffer<cr>

let g:which_key_map.g = {
			\ "name":"golang",
			\ "d":"def",
			\ "t":"text of doc"
			\ }
au FileType go nmap <leader>gd <Plug>(go-def-vertical)
au FileType go nmap <leader>gt <Plug>(go-doc-vertical)

let g:which_key_map.m = {
			\ "name":"标签",
			\ "c":"clean标签",
			\ "l":"list标签",
			\ "t":"toggle标签"
			\ }
nmap <leader>mc :call signature#mark#Purge("all")<cr>
nmap <leader>ml :SignatureListBufferMarks<cr>
nmap <leader>mt m

let g:which_key_map.p = {
			\ "name":"python",
			\ "a":"assign",
			\ "g":"goto",
			\ "i":"import"
			\ }
nmap <leader>pa :call jedi#goto_assignments()<cr>
nmap <leader>pg :call jedi#goto()<cr>
nmap <leader>pi :ImportName<cr>

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
nmap <Leader>tf :Autoformat<CR>

let g:which_key_map.w = {
			\ "name":"windows",
			\ "n":"nerdtree",
			\ "v":"左右分割窗口",
			\ "h":"上下分割窗口"
			\ }
nmap <leader>wn :NERDTreeToggle<CR>
nmap <leader>wv :vs<CR>
nmap <leader>wh :sp<CR>

let g:which_key_map.x = {
			\ "name":"tools",
			\ "c":"clean plugin",
			\ "i":"install plugin",
			\ "s":"source %",
			\ "u":"update plugin",
			\ "w":"workers need todo",
			\ "t":"tagbar"
			\ }
nmap <leader>xw :TODOToggle<CR>
nmap <leader>xt :TagbarToggle<CR>
nmap <leader>xc :PlugClean<cr>
nmap <leader>xi :PlugInstall<cr>
nmap <leader>xs :source %<cr>
nmap <leader>xu :PlugUpdate<cr>

call which_key#register('<Space>', "g:which_key_map")

"--------->
" tagbar
let g:tagbar_type_go = {
			\ 'ctagstype' : 'go',
			\ 'kinds'     : [
			\ 'p:package',
			\ 'i:imports:1',
			\ 'c:constants',
			\ 'v:variables',
			\ 't:types',
			\ 'n:interfaces',
			\ 'w:fields',
			\ 'e:embedded',
			\ 'm:methods',
			\ 'r:constructor',
			\ 'f:functions'
			\ ],
			\ 'sro' : '.',
			\ 'kind2scope' : {
			\ 't' : 'ctype',
			\ 'n' : 'ntype'
			\ },
			\ 'scope2kind' : {
			\ 'ctype' : 't',
			\ 'ntype' : 'n'
			\ },
			\ 'ctagsbin'  : 'gotags',
			\ 'ctagsargs' : '-sort -silent'
			\ }

"--------->
" python-mode
let g:pymode_run = 0
let g:pymode_breakpoint = 0
let g:pymode_python = 'python3'
let g:pymode_virtualenv = 1
let g:pymode_lint = 0


"--------->
" jedi
let g:jedi#use_splits_not_buffers="left"
let g:jedi#auto_initialization = 1
" 取消快捷键，用whick_key_map代替
let g:jedi#goto_command=""
let g:jedi#rename_command=""
let g:jedi#usages_command=""
let g:jedi#goto_assignments_command=""


"*****************************************************************************
"" 自定义方法
"*****************************************************************************
"--------->
" 新建.py文件，自动插入文件头
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
" 新建.php文件，自动插入文件头
autocmd bufnewfile *.php call HeaderOfPHP()
func! HeaderOfPHP()
	call setline(1, "<?php")
	normal G
	normal o
	normal o
endf

"--------->
" 自动import
func! AutoImport()
	if &filetype == 'python'
		exec "ImportName"
	elseif &filetype == 'php'
		call PhpExpandClass()
	endif
endfunc


"*****************************************************************************
"" 快捷键
"*****************************************************************************
"--------->
" 切换打开的窗口"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"--------->
" copy to system clipboard
vnoremap <C-y> "+y
