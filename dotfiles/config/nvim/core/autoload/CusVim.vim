scriptencoding utf-8


function! s:generate_cache() abort
    call CusVim#cache#init()
    execute 'source ' . g:CusVim.info
endfunction


function! s:init() abort
    call s:check_plug_manager()
    call CusVim#cache#init()
    execute 'source ' . g:CusVim.info
    call s:register_plugins()
    call timer_start(50, function("s:lazy_install_plug", []))
endfunction


function! s:lazy_install_plug(...) abort
    silent PlugInstall --sync | q
endfunction


function! s:check_plug_manager() abort
    let l:plug_path = '~/.local/share/nvim/site/autoload/plug.vim'
    if empty(glob(l:plug_path))
        echo '==> Downloading vim-plug ......'
        execute '!curl -fLo' l:plug_path '--create-dirs'
                    \   'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    endif

endfunction


function! s:cocinit() abort
    call coc#util#build()
    CocInstall coc-json coc-html coc-css coc-emmet
	CocInstall coc-dictionary coc-tag coc-word
	CocInstall coc-gocode
	CocInstall coc-ultisnips coc-neosnippet coc-snippets
	CocInstall coc-vetur coc-tsserver
	CocInstall coc-pyls
endfunction


function! s:define_command() abort
    command! -nargs=0    Cusvim           call s:init()
    command! -nargs=0    Cocinit          call s:cocinit()
    command! -nargs=+    MP               call s:my_plugin(<args>)
endfunction


function! s:my_plugin(plugin, ...) abort
    if a:0 == 1
        Plug a:plugin, a:1
    else
        Plug a:plugin
    endif
endfunction


function! s:register_plugins() abort
    call plug#begin(g:CusVim.cache_dir . '/plugged')

    for l:pkg in g:CusVim.pkgs
        execute 'source ' . l:pkg
    endfor

    call plug#end()
endfunction

function! CusVim#bootstrap() abort
    call s:define_command()
    if !filereadable(g:CusVim.info)
        call s:init()
    endif
    execute 'source ' . g:CusVim.info

    call s:register_plugins()
    call s:load_config()
    call s:load_user_config()
endfunction


function! s:load_config() abort
    execute 'source ' . g:CusVim.root . '/core/autoload/CusVim/config.vim'

    for l:pkg in g:CusVim.pkgs_config
        execute 'source ' . l:pkg
    endfor
endfunction


function! s:load_user_config() abort
    for l:item in g:CusVim.user_configs
        if filereadable(l:item)
            execute 'source ' . l:item
        endif
    endfor
endfunction
