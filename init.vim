set encoding=utf-8 " use UTF-8 encoding

" plugin configuration
packadd myconfig_pre

function! s:init()
    " personal vim settings
    packadd myconfig_post

    " load status line
    packadd lightline

    " set color scheme
    colorscheme peaksea
endfunction

au VimEnter * call s:init()
