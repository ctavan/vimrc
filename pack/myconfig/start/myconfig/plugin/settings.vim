" FROM: https://github.com/jceb/vimrc/blob/master/pack/myconfig/opt/myconfig_pre/plugin/settings.vim

" Global Settings:
" ----------------

" Prevent modelines in files from being evaluated (avoids a potential
" security problem wherein a malicious user could write a hazardous
" modeline into a file) (override default value of 5)
set modeline
set modelines=5


" Miscellaneous Settings:
" -----------------------

set commentstring=#%s          " set default comment string to octothorpe
set comments=b:#,fb:-,fb:*     " Remove some legacy and C comment strings
set path=.,,                   " limit path
set swapfile                   " write swap files
set directory=~/.cache/vim/swap//  " place swap files outside the current directory
set nobackup                   " don't write backup copies
set writebackup                " write a backup before writing a file
set gdefault                   " substitute all matches by default
set ignorecase                 " ignore case by default for search patterns
set magic                      " special characters that can be used in search patterns
set hidden                     " allow hidden buffers with modifications
set whichwrap=<,>              " Cursor key move the cursor to the next/previous line if pressed at the end/beginning of a line
"set backspace=indent,eol,start " more powerful backspacing
set grepprg=rg\ --vimgrep      " use ripgrep

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pdf,.exe
set sessionoptions-=options    " do not store global and local values in a session
set sessionoptions-=folds      " do not store folds
set switchbuf=usetab           " This option controls the behavior when switching between buffers.
set printoptions=paper:a4,syntax:n " controls the default paper size and the printing of syntax highlighting (:n -> none)

" enable persistent undo and save all undo files in ~/.cache/vimundo
if has('persistent_undo')
  exec 'set undodir='.fnameescape($HOME.'/.cache/vim/undo//')
  set undofile
  if ! isdirectory(&undodir)
    call mkdir(&undodir, 'p')
  endif
endif

" Visual Settings:
" ----------------

set ttyfast                    " we have a fast terminal connction
set showmode                   " show vim's current mode
set showcmd                    " show vim's current command
set showmatch                  " highlight mathing brackets
set nohlsearch                 " don't highlight search results by default as I'm using them to navigate around
set nowrap                     " don't wrap long lines by default
set mouse=a                    " Enable the use of a mouse
set noerrorbells               " disable error bells
set novisualbell               " disable beep
set wildmode=list:longest,full   " Don't start wildmenu immediately but list the alternatives first and then do the completion if the user requests it by pressing wildkey repeatedly
set wildignore-=tmp
set wildignore+=*.DS_STORE,*~,*.o,*.obj,*.pyc,.git,.svn,.hg
set wildcharm=<C-Z>            " Shortcut to open the wildmenu when you are in the command mode - it's similar to <C-D>
set nofoldenable               " start editing with all folds open
"set foldmethod=indent          " Use indent for folding by default
"set foldminlines=0             " number of lines above which a fold can be displayed
set linebreak                  " If on Vim will wrap long lines at a character in 'breakat'
"set breakindent                " indent wrapped lines visually
set showtabline=2              " always show tabline, even if there is just one tab, avoid redraw problems when Window is displayed in fullscreen mode
"set foldcolumn=1               " show folds
set colorcolumn=+1             " color specified column in order to help respecting line widths
set termguicolors              " true color for the terminal
set number relativenumber      " show linenumbers
set completeopt=menuone,preview  " show the complete menu even if there is just one entry
set splitright                 " put the new window right of the current one
set splitbelow                 " put the new window below the current one
set list                       " list nonprintable characters
if $LANG =~ '.*\.UTF-8$' || $LANG =~ '.*utf8$' || $LANG =~ '.*utf-8$'
  set listchars=tab:»·,trail:·,nbsp:␣ " list nonprintable characters
  set showbreak=↪\           " identifier put in front of wrapped lines
endif
set fillchars=vert:│,diff:—,fold:—    " get rid of the gab between the vertical bars
set scrolloff=3                " always show context at top and bottom
set guioptions=aegimtc         " disable scrollbars
set cpoptions=aABceFsqJ        " q: When joining multiple lines leave the cursor at the position where it would be when joining two lines.
                               " $:  When making a change to one line, don't redisplay the line, but put a '$' at the end of the changed text.
                               " v: Backspaced characters remain visible on the screen in Insert mode.
                               " J: a sentence is followed by two spaces
" set synmaxcol=200              " stop syntax highlighting at a certain column to improve speed

" Text Settings:
" --------------

set virtualedit=block        " allow the cursor to move beyond the last character of a line
"set copyindent               " always copy indentation level from previous line
"set nocindent                " disable cindent - it doesn't go well with formatoptions
set textwidth=80             " default textwidth
set shiftwidth=2             " number of spaces to use for each step of indent
set tabstop=2                " number of spaces a tab counts for
set softtabstop=2            " number of spaces a tab counts for
set expandtab                " insert tabs instead of spaces
set nosmartcase              " smart case search (I don't like it that much since it makes * and # much harder to use)
set formatoptions=crqj       " no automatic linebreak, no whatsoever expansion
set pastetoggle=<F11>        " put vim in pastemode - usefull for pasting in console-mode
set iskeyword+=_             " these characters also belong to a word
"set matchpairs+=<:>          " angle brackets should also being matched by %
set complete+=i              " scan included files and dictionary (if spell checking is enabled)


" CHRISTOPHS SETTINGS

" Share clipboards
set clipboard=unnamed

set number
set norelativenumber
set smartindent

set wildmenu

set noautochdir

set incsearch
set hlsearch

" Appearence
set background=dark
set guifont=Source\ Code\ Pro\ for\ Powerline:h13 " guifont + fontsize
set guicursor=a:blinkon0       " cursor-blinking off!!

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
autocmd FileType xml setlocal ts=2 sts=2 sw=2 expandtab
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


" Colorizer
let g:colorizer_auto_filetype='css,html'
let g:colorizer_auto_map = 1

" Lightline
" if !has('gui_running')
"   set t_Co=256
" endif
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }


" delimitMate config
"https://github.com/Raimondi/delimitMate/issues/53
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
imap <expr><CR> pumvisible() ? "\<C-n>" : "<Plug>delimitMateCR"


" Remember cursor position
" http://askubuntu.com/a/202077
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>F :Files <C-r>=Expand_file_directory()<CR><CR>
nnoremap <leader>g :GitFiles<CR>
nnoremap <leader>c :BCommits<CR>
nnoremap <leader>C :Commits<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>W :Windows<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>L :Lines<CR>
nnoremap <leader>? :Helptags<CR>
nnoremap <leader>: :Commands<CR>
nnoremap <leader>; :Commands<CR>
nnoremap <leader>h :History:<CR>
nnoremap <leader>/ :History/<CR>

" Quickfix
nnoremap <down> :cnext<CR>
nnoremap <up> :cprev<CR>

" Arrows for next buffer the arrows to something usefull
nnoremap <right> :bn<CR>
nnoremap <left> :bp<CR>

" strip trailing whitespaces
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Handle files that changed on disk in neovim
" https://github.com/neovim/neovim/issues/2127#issuecomment-150954047
augroup AutoSwap
  autocmd!
  autocmd SwapExists *  call AS_HandleSwapfile(expand('<afile>:p'), v:swapname)
augroup END

function! AS_HandleSwapfile (filename, swapname)
        " if swapfile is older than file itself, just get rid of it
        if getftime(v:swapname) < getftime(a:filename)
                call delete(v:swapname)
                let v:swapchoice = 'e'
        endif
endfunction
autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
  \ if isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif

augroup checktime
  au!
  if !has("gui_running")
    "silent! necessary otherwise throws errors when using command
    "line window.
    autocmd BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI,FocusGained,BufEnter,FocusLost,WinLeave * checktime
  endif
augroup END
