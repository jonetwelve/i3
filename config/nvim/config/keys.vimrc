" NERDT
map <F3> <ESC>:NERDTreeMirror<CR>
map <F3> <ESC>:NERDTreeToggle<CR>

" tagbar"
nmap <F8> :TagbarToggle<CR>

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

"todo
nmap <F7> :TODOToggle<CR>

" 切换打开的窗口"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"去空行
nnoremap <F2> :g/^\s*$/d<CR>

" tab"
imap <silent><C-n> <ESC><ESC>:tabnew<cr>
nmap <silent><C-n> <ESC><ESC>:tabnew<cr>
imap <silent><C-w> <ESC><ESC>:tabc!<cr>
nmap <silent><C-w> <ESC><ESC>:tabc!<cr>
nmap <silent><tab> <ESC><ESC>:tabnext<CR>

" deoplete tab-complete
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
" ,<tab> for regular tab
inoremap <Leader><Tab> <Space><Space>
