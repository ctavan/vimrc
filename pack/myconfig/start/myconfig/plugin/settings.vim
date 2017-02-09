set number
set norelativenumber

" Appearence
set background=dark
colorscheme peaksea
set guifont=Source\ Code\ Pro\ for\ Powerline:h13 " guifont + fontsize

" nerdtree
nmap <leader>w :NERDTreeToggle<CR>

" UltiSnips
"http://stackoverflow.com/a/18685821/1053532
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" End stackoverflow
let g:UltiSnipsExpandTrigger = '<S-CR>'


" Tab-Styles
set ts=4 sts=4 sw=4 expandtab
autocmd FileType php setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType go setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType perl setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType less setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 textwidth=99 colorcolumn=100 expandtab
autocmd FileType sql setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python setlocal ts=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType sh setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType cpp setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType c setlocal ts=4 sts=4 sw=4 expandtab

" virtual tabstops using spaces
let my_tab=2
execute "set shiftwidth=".my_tab
execute "set softtabstop=".my_tab
set expandtab
