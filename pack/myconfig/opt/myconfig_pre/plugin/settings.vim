" Must appear before plugin initialization for javascript/jsx indentation to
" work
syntax on
filetype plugin indent on

" Must be loaded before everything else, otherwise indentation plugins like
" javascript/jsx won't work:
if has('gui_running')
  colorscheme peaksea
endif

" see https://github.com/junegunn/fzf/wiki/On-MacVim-with-iTerm2
let g:fzf_launcher = 'in-new-term-function %s'
set rtp+=/usr/local/opt/fzf
