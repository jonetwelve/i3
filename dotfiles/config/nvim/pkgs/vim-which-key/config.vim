set nocompatible
set timeoutlen=5

let g:mapleader="\<Space>"

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>



let g:which_key_map = {}

"""""""""""""""""""""""""""" 自定義快捷鍵
let g:which_key_map.b = { 'name':"buffer"}
let g:which_key_map.b.d = ["bd!","delte 当前buffer"]
let g:which_key_map.b.o = [".+1,$bw<cr>:1,.-1bw<cr><cr>","关闭other"]
let g:which_key_map.b.s = ["Buffers","switch buffer"]


let g:which_key_map.c = {"name":"coc / comment"}
let g:which_key_map.c.c = ['call feedkeys("\<plug>NERDCommenterToggle")',"comment"]
let g:which_key_map.c.s = ['call feedkeys("\<plug>NERDCommenterSexy<cr>")',"commenter sexy"]


let g:which_key_map.f = {"name":"文件"}
let g:which_key_map.f.l = ["Files","list"]


let g:which_key_map.l = {"name":"language"}
let g:which_key_map.l.d = ["call CocAction('doHover')","document"]
let g:which_key_map.l.f = ["Autoformat","format"]
let g:which_key_map.l.g = {"name":"跳转"}
let g:which_key_map.l.g.d = ['call feedkeys("\<Plug>(coc-definition)")',"definition"]
let g:which_key_map.l.g.i = ['call feedkeys("\<Plug>(coc-implementation)")',"implementation"]
let g:which_key_map.l.g.r = ['call feedkeys("\<Plug>(coc-references)")',"references"]
let g:which_key_map.l.g.t = ['call feedkeys("\<Plug>(coc-type-definition)")',"type references"]
let g:which_key_map.l.r = ['call feedkeys("\<Plug>(coc-rename)")',"rename"]


let g:which_key_map.m ={"name":"标签"}
let g:which_key_map.m.c = ['call signature#mark#Purge("all")',"clean标签"]
let g:which_key_map.m.l = ["SignatureListBufferMarks","list标签"]
let g:which_key_map.m.t = ["SignatureToggleSigns","toggle标签"]


nnoremap <silent> <leader>ss :Rg!<CR>
nnoremap <silent> <leader>sn :nohl<CR>
let g:which_key_map.s = {"name":"搜索"}
let g:which_key_map.s.f = ["Files","搜索files"]
let g:which_key_map.s.s = "搜索text"
let g:which_key_map.s.n = "no搜索高亮"


nnoremap <silent> <leader>ts :w !sudo tee %<CR>
let g:which_key_map.t = { "name":"代码"}
let g:which_key_map.t.r = ["QuickRun","run"]
let g:which_key_map.t.s = "save as sudo"


nmap   <silent> <leader>ws  <Plug>(choosewin)
let g:which_key_map.w = { "name":"windows"}
let g:which_key_map.w.s = "选择窗口"
let g:which_key_map.w.n = ["NERDTreeToggle", "文件树"]
let g:which_key_map.w.v = ["vs", "左右分割窗口"]
let g:which_key_map.w.h = ["sp", "上下分割窗口"]
let g:which_key_map.w.t = ["TagbarToggle", "tagbar"]


let g:which_key_map.x = {"name":"tools"}
let g:which_key_map.x.a = ['call feedkeys("\<Plug>ToggleAutoCloseMappings")',"auto close toggle"]
let g:which_key_map.x.c = ["PlugClean","clean plugin"]
let g:which_key_map.x.h = ["help","help"]
let g:which_key_map.x.i = ["PlugInstall","install plugin"]
let g:which_key_map.x.s = ["source %","source %"]
let g:which_key_map.x.u = ["PlugUpdate","update plugin"]


nnoremap <silent> <leader>za <ESC>za
nnoremap <silent> <leader>zA <ESC>zA
nnoremap <silent> <leader>zR <ESC>zR
nnoremap <silent> <leader>zM <ESC>zM
let g:which_key_map.z = {"name":"折叠"}
let g:which_key_map.z.a = "toggle折叠"
let g:which_key_map.z.A = "递归toggle折叠"
let g:which_key_map.z.R = "打开全部折叠"
let g:which_key_map.z.M = "关闭全部折叠"


"""""""""""""""""""""""""""" 自定義快捷鍵結束

call which_key#register('<Space>', "g:which_key_map")

