set encoding=utf-8


" For some weird reason indentation is broken in nvim when loading the polyglot
" plugin through the new pack autoload feature. Therefore fall back to using
" pathogen for this plugin:
call pathogen#runtime_append_all_bundles()
execute pathogen#infect()
call pathogen#helptags()


packadd myconfig_pre

function! s:init()
  packadd lightline
  packadd myconfig_post
endfunction

au VimEnter * call s:init()
