"*****************************************************************************
"" 插件管理
"*****************************************************************************
call plug#begin('~/.cache/nvim/plugged')
  for f in split(glob('~/.config/nvim/plugins/*'), '\n')
    exe 'source' f
  endfor
call plug#end()

"*****************************************************************************
"" 其他配置
"*****************************************************************************
source ~/.config/nvim/functions.vim
source ~/.config/nvim/keys.vim
source ~/.config/nvim/config.vim
