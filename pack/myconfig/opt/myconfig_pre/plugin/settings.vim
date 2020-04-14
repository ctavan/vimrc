" Must appear before plugin initialization for javascript/jsx indentation to
" work:
syntax on
filetype plugin indent on

" Must also appear before plugin initialization for fzf to configure properly:
" see https://github.com/junegunn/fzf/wiki/On-MacVim-with-iTerm2
let g:fzf_launcher = 'in-new-term-function %s'
set rtp+=/usr/local/opt/fzf

" Colorizer must be configured before plugin loading
let g:colorizer_auto_filetype='css,html,js,jsx'

" disable python2
let g:loaded_python_provider = 0
" configure python3 path
let g:python3_host_prog = '/usr/local/opt/python/libexec/bin/python'
