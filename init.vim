set encoding=utf-8

packadd myconfig_pre

call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/peaksea'
Plug 'chrisbra/Colorizer'
Plug 'vim-scripts/BufOnly.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-eunuch'

call plug#end()

function! s:init()
  packadd lightline
  packadd myconfig_post
endfunction

au VimEnter * call s:init()
