let g:mapleader = "\<Space>"
let g:maplocalleader = ","

let g:lmap =  {}


let g:lmap.b = { 'name':"buffer"}
let g:lmap.b.d = ["bd!","delte 当前buffer"]
let g:lmap.b.o = [".+1,$bw<cr>:1,.-1bw<cr><cr>","关闭other"]
let g:lmap.b.s = ["Buffers","switch buffer"]


let g:lmap.c = {"name":"coc / comment"}
let g:lmap.c.c = ['call feedkeys("\<plug>NERDCommenterToggle")',"comment"]
let g:lmap.c.s = ['call feedkeys("\<plug>NERDCommenterSexy<cr>")',"commenter sexy"]


let g:lmap.f = {"name":"文件"}
let g:lmap.f.l = ["Files","list"]


let g:lmap.l = {"name":"language"}
let g:lmap.l.d = ["call CocAction('doHover')","document"]
let g:lmap.l.f = ["Autoformat","format"]
let g:lmap.l.g = {"name":"跳转"}
let g:lmap.l.g.d = ['call feedkeys("\<Plug>(coc-definition)")',"definition"]
let g:lmap.l.g.i = ['call feedkeys("\<Plug>(coc-implementation)")',"implementation"]
let g:lmap.l.g.r = ['call feedkeys("\<Plug>(coc-references)")',"references"]
let g:lmap.l.g.t = ['call feedkeys("\<Plug>(coc-type-definition)")',"type references"]
let g:lmap.l.r = ['call feedkeys("\<Plug>(coc-rename)")',"rename"]


let g:lmap.m ={"name":"标签"}
let g:lmap.m.c = ['call signature#mark#Purge("all")',"clean标签"]
let g:lmap.m.l = ["SignatureListBufferMarks","list标签"]
let g:lmap.m.t = ["SignatureToggleSigns","toggle标签"]


let g:lmap.s = {"name":"搜索"}
let g:lmap.s.f = ["Files","搜索files"]
let g:lmap.s.s = ["Ag!","搜索text"]
let g:lmap.s.n = ["nohl","no搜索高亮"]


let g:lmap.t = { "name":"代码"}
let g:lmap.t.r = ["QuickRun","run"]
let g:lmap.t.s = ["w !sudo tee %","save as sudo"]


let g:lmap.w = { "name":"windows"}
let g:lmap.w.n = ["NERDTreeToggle", "文件树"]
let g:lmap.w.v = ["vs", "左右分割窗口"]
let g:lmap.w.h = ["sp", "上下分割窗口"]
let g:lmap.w.t = ["TagbarToggle", "tagbar"]


let g:lmap.x = {"name":"tools"}
let g:lmap.x.a = ['call feedkeys("\<Plug>ToggleAutoCloseMappings")',"auto close toggle"]
let g:lmap.x.c = ["PlugClean","clean plugin"]
let g:lmap.x.h = ["help","help"]
let g:lmap.x.i = ["PlugInstall","install plugin"]
let g:lmap.x.s = ["source %","source %"]
let g:lmap.x.u = ["PlugUpdate","update plugin"]



call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>
