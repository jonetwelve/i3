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
