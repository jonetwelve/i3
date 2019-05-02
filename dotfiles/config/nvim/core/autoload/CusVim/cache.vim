scriptencoding utf-8

if exists("g:loaded_CusVim_cache")
    finish 
endif
let g:loaded_CusVim_cache=1

" 生成缓存
function! CusVim#cache#init() abort
py3 << EOF
import os
import vim

pkgs_base = vim.eval('g:CusVim.pkg_dir')
excluded_list = vim.eval('g:CusVim.excluded')
cache_dir = vim.eval('g:CusVim.cache_dir')

pkgs = []
pkgs_config = []

for f in os.listdir(pkgs_base):
	if not os.path.isdir(os.path.join(pkgs_base, f)) or f in excluded_list:
		continue
	_pkg = os.path.join(pkgs_base, f, 'package.vim')
	if os.path.isfile(_pkg):
		pkgs.append(_pkg)
		_pkg_config = os.path.join(pkgs_base, f, 'config.vim')
		if os.path.isfile(_pkg_config):
			pkgs_config.append(_pkg_config)

if not os.path.isdir(cache_dir):
	os.mkdir(cache_dir)
f = open(vim.eval('g:CusVim.info'), 'w')
f.write("let g:CusVim.pkgs = %s\n" % pkgs)
f.write("let g:CusVim.pkgs_config = %s\n" % pkgs_config)
f.close()

EOF
endfunction
