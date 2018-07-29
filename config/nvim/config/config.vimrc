filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore=['.*\.pyc', '__pycache__']
let g:nerdtree_tabs_open_on_console_startup=0
let NERDTreeShowBookmarks=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" markdown"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_syntax_conceal = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jedi"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#completions_enabled    = 1
let g:jedi#auto_initialization    = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#use_tabs_not_buffers   = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '◐'
hi clear ALEErrorSign
hi clear ALEWarningSign

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rainbow_parentheses
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neoformat
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentline
"缩进指示线"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gruvbox
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme onedark
set background=dark


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ultisnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" phpcomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:phpcomplete_relax_static_constraint = 1
let g:phpcomplete_complete_for_unknown_classes = 1
let g:phpcomplete_search_tags_for_variables = 1
let g:phpcomplete_parse_docblock_comments = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" startify
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
\'    |  \ss:边栏查找                            \cc:单行注释             |',
\'    |  <c-y>,:emmet补全                        \cs:块注释               |',
\'    *-------------------------------------------------------------------*',
\'       o',
\'        o   ^__^',
\'         o  (oo)\_______',
\'            (__)\       )\/\',
\'                ||----w |',
\'                ||     ||']
