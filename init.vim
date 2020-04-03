set encoding=utf-8

call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'

call plug#end()

packadd myconfig_pre

function! s:init()
  packadd lightline
  packadd myconfig_post
endfunction

au VimEnter * call s:init()
