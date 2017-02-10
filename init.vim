set encoding=utf-8 " use UTF-8 encoding

" plugin configuration
packadd myconfig_pre

function! s:init()
    " set color scheme
    colorscheme peaksea

    " personal vim settings
    packadd myconfig_post
endfunction

au VimEnter * call s:init()
