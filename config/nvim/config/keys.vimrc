nnoremap <Leader>w :w<cr>
nnoremap <Leader>q :q<cr>

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>


"去空行
nnoremap <F2> :g/^\s*$/d<CR>

" NERDT
map <F3> <ESC>:NERDTreeMirror<CR>
map <F3> <ESC>:NERDTreeToggle<CR>

" 自动import
map <F4> :call AutoImport()<CR>

" 运行代码
map <F5> :call RunScript()<CR>

" neoformat,格式化代码
nmap <F6> :call FormatScript()<CR><CR>

"todo
nmap <F7> :TODOToggle<CR>

" tagbar"
nmap <F8> :TagbarToggle<CR>

" insert doc"
nmap <F9> :call InsertDoc()<CR>

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


" 切换打开的窗口"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" tab"
imap <silent><C-n> <ESC><ESC>:tabnew<cr>
nmap <silent><C-n> <ESC><ESC>:tabnew<cr>
imap <silent><C-w> <ESC><ESC>:tabc!<cr>
nmap <silent><C-w> <ESC><ESC>:tabc!<cr>
nmap <silent><tab> <ESC><ESC>:tabnext<CR>

" deoplete tab-complete
"inoremap <silent><expr> <Space> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
" ,<tab> for regular tab
inoremap <Leader><Tab> <Space><Space>

" copy to system clipboard
vnoremap <C-y> "+y

