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
        call setline(1,"# File Name: ".expand("%"))
        call append(line("."),"")
        call append(line(".")+1, "") 
        call append(line(".")+2, "") 
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
" 按F4自动impor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! AutoImport()
    if &filetype == 'python'
        exec "ImportName"
    elseif &filetype == 'php'
        call PhpExpandClass()
    endif
endfunc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按F5编译运行
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! RunScript()
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
" 按F6格式化代码
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! FormatScript()
	exec "w"
    if &filetype == 'python'
        exec "Neoformat"
        exec "!isort %"
    elseif &filetype == 'php'
        exec "!php-cs-fixer fix %"
    endif
	exec "e!"
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
