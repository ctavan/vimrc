" Must appear before plugin initialization for javascript/jsx indentation to
" work:
syntax on
filetype plugin indent on

" As opposed to NeoVim, MacVim requires the colorscheme to be loaded before
" everything else, otherwise indentation plugins like javascript/jsx won't work:
if has('gui_running')
  colorscheme peaksea
endif

" Must also appear before plugin initialization for fzf to configure properly:
" see https://github.com/junegunn/fzf/wiki/On-MacVim-with-iTerm2
let g:fzf_launcher = 'in-new-term-function %s'
set rtp+=/usr/local/opt/fzf
