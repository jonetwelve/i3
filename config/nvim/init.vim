"*****************************************************************************
"" 插件管理
"*****************************************************************************
call plug#begin('~/.cache/nvim/plugged')
  for f in split(glob('~/.config/nvim/plugins/*'), '\n')
    exe 'source' f
  endfor

" 加载主题
call LoadRandomTheme()
call plug#end()

"*****************************************************************************
"" 其他配置
"*****************************************************************************
source ~/.config/nvim/functions.vim
source ~/.config/nvim/keys.vim
source ~/.config/nvim/config.vim

"-------------->
" 设置主题
if has('python3')
    call SetRandomTheme()
else
    colorscheme onedark
endif
