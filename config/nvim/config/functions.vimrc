"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新文件标题
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.py文件，自动插入文件头 
autocmd BufNewFile *.php,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func! SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'php' 
        call setline(1,"<?php") 
        call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1,"")
        call append(line(".")+2, "# File Name: ".expand("%")) 
        call append(line(".")+3, "") 
        call append(line(".")+4, "") 
        call append(line(".")+5, "") 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "  > Author: ") 
        call append(line(".")+2, "  > Mail: ") 
        call append(line(".")+3, "  > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    "新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按F5编译运行
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'php'
        exec "!php %"
    endif
endfunc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"代码格式优化化
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F6> :call FormartSrc()<CR><CR>
func! FormartSrc()
    exec "w"
    if &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    endif
    exec "e! %"
endfunc



"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动补全括号，引号
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf
