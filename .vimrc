" # BASIC OPTIONS
set nocompatible
set number
syntax on
" - Indentation options
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set softtabstop=0
" Indentations for other programming langs
autocmd FileType ruby setlocal ts=2 sts=2 sw=2 et
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noet

" # ADVANCED OPTIONS
"set visualbell
" set terminal colormode, must be set before any colorschemes and highlights
set t_Co=256
set background=dark
" set own colors
" 1 - red, 2 - green, 3 - orange, 4 - cyan, 5 - magenta,
" 6 - lightblue, 7 - lightgray, 8 - gray, 9 - pink, 10 - lightgreen
" 11 - yellow, 12 - blue, 13 - lightpink, 14 - greenblue
" 15 - white, 16 (0) - black, 17 - darkcyan, 18 - cyan
" 22 - grassgreen
highlight Number ctermfg=3
highlight LineNr ctermfg=11
highlight String ctermfg=2
highlight Comment ctermfg=7
highlight Statement cterm=bold ctermfg=4
highlight PreProc cterm=bold ctermfg=10
highlight Function ctermfg=11
highlight Identifier ctermfg=3 cterm=bold
highlight ModeMsg ctermbg=9 ctermfg=3
highlight StatusLineNC ctermbg=8 ctermfg=12 cterm=bold
highlight StatusLine ctermfg=12
highlight Type ctermfg=2
highlight Todo cterm=reverse,bold
highlight Directory cterm=bold ctermfg=4
highlight VertSplit ctermfg=5
highlight Visual ctermbg=8 cterm=None
highlight SearchOn term=reverse ctermfg=0 ctermbg=11
highlight link IncSearch SearchOn
highlight link Search SearchOn
highlight Pmenu ctermbg=0 ctermfg=3
highlight PmenuSel ctermbg=4 ctermfg=3 cterm=none
highlight PmenuSbar ctermbg=8
highlight PmenuThumb ctermbg=3
" - Highlight search
set hls
" - Higlight line under cursos
set cursorline
highlight CursorLine ctermbg=8 cterm=None
" Color column
if exists('+colorcolumn')
    set colorcolumn=80
    highlight ColorColumn ctermbg=8
else
    highlight ColorColumn ctermbg=11
    au BufWinEnter,InsertLeave python match ColorColumn '\%<81v.\%>80v'
endif
" - Better command-line completion
" -- zsh style
set wildmenu
set wildmode=full
" -- bash style
"set wildmode=longest,list
" - Show partial commands in the last line of the screen
set showcmd
" - Display cursor position
set ruler
" - Always display the status line, even if only one window is displayed
set laststatus=2
" No backup and swap
set nobackup
set nowritebackup
set noswapfile
" Backspace
set backspace=indent,eol,start
" - bind \q for nohlsearch
nmap \q :nohlsearch<CR>
" - Easier moving of selected code blocks
vnoremap < <gv
vnoremap > >gv

" # EXPERT OPTIONS
" Use pathogen for manipulating vim plugins
execute pathogen#infect()

" Autocompletion
filetype plugin on

" Show whitespace
highlight ExtraWhitespace ctermbg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Shortcut to start NERDTree
nmap <leader>tr :NERDTree

let g:airline_theme='jellybeans'

" # CONFIGURE LOOK, use buffers in tab-like mode
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Turn on powerline fonts (you need turn on in Terminal also)
let g:airline_powerline_fonts = 1

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap ,l :bnext<CR>

" " Move to the previous buffer
nmap ,h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap ,q :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap ,bl :ls<CR>

" # AUTOCOMMANDS
" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" Update VIM after writing .vimrc (no need to reload)
autocmd! bufwritepost .vimrc source %

" Start NERDTree at Vim start
" autocmd VimEnter * NERDTree

" # USER FUNCTIONS AND COMMANDS
" Save session, when NERDTree is opened
fu! Savesession(fname)
    NERDTreeClose
    exec "mksession! " . a:fname
    NERDTree
endfu

command! -nargs=1 SaveSession call Savesession(<f-args>)
