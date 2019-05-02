let g:denite_options = {
            \ 'default' : {
            \ 'winheight' : 15,
            \ 'mode' : 'insert',
            \ 'quit' : 1,
            \ 'highlight_matched_char' : 'MoreMsg',
            \ 'highlight_matched_range' : 'MoreMsg',
            \ 'direction': 'rightbelow',
            \ 'statusline' : has('patch-7.4.1154') ? v:false : 0,
            \ 'prompt' : '➭',
            \ }}
call denite#custom#var('file/rec', 'command',
            \ ['ag', '-l', '-g', '', '--ignore-dir', 'node_modules',
            \ '--ignore-dir',  'vendor', '--ignore-dir',  '.git',
            \ '--ignore-dir',  '__pycache__' , '--ignore-dir', '.vscode',
            \ '--ignore-dir',  'venv'
            \ ])
call denite#custom#map(
            \ 'insert',
            \ '<C-j>',
            \ '<denite:move_to_next_line>',
            \ 'noremap'
            \)
call denite#custom#map(
            \ 'insert',
            \ '<C-k>',
            \ '<denite:move_to_previous_line>',
            \ 'noremap'
            \)
call denite#custom#map(
            \ 'normal',
            \ '<C-j>',
            \ '<denite:move_to_next_line>',
            \ 'noremap'
            \)
call denite#custom#map(
            \ 'normal',
            \ '<C-k>',
            \ '<denite:move_to_previous_line>',
            \ 'noremap'
            \)
