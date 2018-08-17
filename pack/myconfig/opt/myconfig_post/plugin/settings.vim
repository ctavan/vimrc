" Config loaded after all other configs/plugins are loaded

" NeoVim requires the colorscheme to be loaded after all plugins have been
" initialized. In MacVim this would lead to broken indentation in language
" plugins like javascript/jsx.
if !has('gui_running')
  colorscheme peaksea
end

" Customize the highlight line
set nocursorline
"hi CursorLine guifg=NONE guibg=#303030 gui=NONE
