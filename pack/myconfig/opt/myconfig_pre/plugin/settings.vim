" Must be loaded before everything else, otherwise indentation plugins like
" javascript/jsx won't work:
syntax on
colorscheme peaksea

" see https://github.com/junegunn/fzf/wiki/On-MacVim-with-iTerm2
let g:fzf_launcher = 'in-new-term-function %s'
set rtp+=/usr/local/opt/fzf
