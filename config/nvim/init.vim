filetype plugin on
syntax enable

let maplocalleader = "\\"

call plug#begin()

Plug 'lervag/vimtex'

call plug#end()

let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'

augroup vimtex_auto_start
  autocmd!
  autocmd User VimtexEventInitPost call vimtex#compiler#start()
  autocmd User VimtexEventInitPost call vimtex#view#view()
augroup END
