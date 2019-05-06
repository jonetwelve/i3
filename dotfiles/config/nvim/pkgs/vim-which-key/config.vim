let g:mapleader = "\<Space>"
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
set timeoutlen=50
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
nnoremap <leader>bd :bd!<cr>
nnoremap <leader>bo :.+1,$bw<cr>:1,.-1bw<cr><cr>
nnoremap <leader>bs :Denite buffer<cr>

let g:which_key_map.c = {
    \ "name":"coc",
    \ "c":"comment",
    \ "e":"extension",
    \ "s":"commenter sexy",
    \ }
nmap <leader>cc <plug>NERDCommenterToggle<cr>
nnoremap <leader>ce :Denite coc-extension<cr>
nmap <leader>cs <plug>NERDCommenterSexy<cr>

let g:which_key_map.d = {
			\ "name":"Denite",
			\ "d":"direcotry",
            \ "e":"extension",
			\ "m":"map"
			\ }
nmap <leader>dd :Denite directory_rec<cr>
nmap <leader>de :Denite coc-extension<cr>
nmap <leader>dm :Denite mapping<cr>

let g:which_key_map.d.f = {
			\ "name":"file",
			\ "l":"list",
			\ "n":"new"
			\ }
nmap <leader>dfl :Denite file buffer<cr>
nmap <leader>dfn :Denite file:new<cr>
let g:Lf_ShortcutF  = '<c-+>'

let g:which_key_map.f = {
			\ "name":"文件",
			\ "l":"list"
			\ }
nnoremap <leader>fl :Denite file buffer<cr>

let g:which_key_map.l = {
    \ "name":"language",
    \ "d":"document",
    \ "f":"format",
    \ "g":{
        \ "name":"跳转",
        \ "d":"definition",
        \ "i":"implementation",
        \ "r":"references",
        \ "t":"type references"
        \ },
    \ "r":"rename"
    \ }
nnoremap <leader>ld :call CocAction('doHover')<CR>
nmap <leader>lf :Autoformat<cr>
nmap <leader>lgd <Plug>(coc-definition)<cr>
nmap <leader>lgi <Plug>(coc-implementation)
nmap <leader>lgr <Plug>(coc-references)
nmap <leader>lgt <Plug>(coc-type-definition)
nmap <leader>lr <Plug>(coc-rename)<cr>

let g:which_key_map.m = {
			\ "name":"标签",
			\ "c":"clean标签",
			\ "l":"list标签",
			\ "t":"toggle标签"
			\ }
nmap <leader>mc :call signature#mark#Purge("all")<cr>
nmap <leader>ml :SignatureListBufferMarks<cr>
nmap <leader>mt :SignatureToggleSigns<cr>

let g:which_key_map.s = {
			\ "name":"搜索",
			\ "f":"搜索files",
			\ "s":"搜索text",
			\ 'n':"no搜索高亮"
			\ }
nnoremap <leader>sf :Denite file/rec buffer<cr>
nnoremap <leader>sn :nohl<cr>
nnoremap <leader>ss :CtrlSF 

let g:which_key_map.t = {
			\ "name":"代码",
			\ "r":"run",
            \ "s":"save as sudo"
			\ }
map <Leader>tr :QuickRun<CR>
map <Leader>ts :w !sudo tee %<CR>

let g:which_key_map.w = {
			\ "name":"windows",
			\ "n":"nerdtree",
			\ "v":"左右分割窗口",
			\ "h":"上下分割窗口",
            \ "t":"tagbar"
			\ }
nmap <leader>wh :sp<CR>
nmap <leader>wn :NERDTreeToggle<CR>
nmap <leader>wt :TagbarToggle<CR>
nmap <leader>wv :vs<CR>

let g:which_key_map.x = {
			\ "name":"tools",
			\ "a":"auto close toggle",
			\ "c":"clean plugin",
			\ "h":"help",
			\ "i":"install plugin",
			\ "s":"source %",
			\ "u":"update plugin",
			\ }
nmap <leader>xa <Plug>ToggleAutoCloseMappings<cr>
nmap <leader>xc :PlugClean<cr>
nmap <leader>xh :help 
nmap <leader>xi :PlugInstall<cr>
nmap <leader>xs :source %<cr>
nmap <leader>xu :PlugUpdate<cr>