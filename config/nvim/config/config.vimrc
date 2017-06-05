filetype plugin indent on

" airline
let g:airline_powerline_fonts                    = 1
let g:airline#extensions#tabline#enabled         = 1
let g:airline#extensions#tabline#left_sep        = ''
let g:airline#extensions#tabline#left_alt_sep    = '|'
let g:airline#extensions#tabline#tab_nr_type     = 1
set laststatus                                   = 2
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

" deoplete
let g:deoplete#enable_at_startup     = 1
let g:deoplete#disable_auto_complete = 0
let g:python3_host_prog              = '/usr/bin/python3'

" CtrlP
let g:ctrlp_prompt_mappings  = {'PrtClearCache()':['<Leader><F5>']}
let g:ctrlp_prompt_mappings  = {'PrtdeleteEnt()':['<Leader><F7>']}
let g:ctrlp_match_window     = 'bottom,order:btt,min:2,max:15'
set wildmenu                 " enhanced autocomplete
set wildignore              += */tmp/*,*/node_modules/*,*/.git/*,*.so,*.swp,*.zip,*node_modules*,*.jpg,*.png,*.svg,*.ttf,*.woff,*.woff3,*.eot,*public/css/*,*public/js*
" 使用ag代替默认的grep搜索
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" nerdtree
let NERDTreeIgnore                 = ['.*\.pyc', '__pycache__']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" markdown"
autocmd BufNewFile,BufReadPost *.md set filetype = markdown
let g:markdown_fenced_languages                  = ['html', 'python', 'bash=sh']
let g:markdown_syntax_conceal                    = 0

" snippets"
let g:snippets_dir="~/.vim/plugged/vim-snippets/snippets"

" jedi"
let g:jedi#completions_enabled    = 1
let g:jedi#auto_initialization    = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#use_tabs_not_buffers   = 1

" vim-lexical
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END
let g:lexical#spell = 1         " 0=disabled, 1=enabled

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" syntastic
let g:syntastic_check_on_open            = 1
let g:syntastic_html_tidy_ignore_errors  = [" proprietary attribute \"ng-"]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_wq              = 0

