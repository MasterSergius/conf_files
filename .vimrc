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

" # ADVANCED OPTIONS
"set visualbell
" - Highlight search
set hls
" - Higlight line under cursos
set cursorline
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

" Shortcut to start NERDTree
nmap <leader>tr :NERDTree

" set terminal colormode, must be set before any colorschemes
set t_Co=256
"nice-looking on fedora
"colorscheme pablo
colorscheme desert
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

" Start NERDTree at Vim start
" autocmd VimEnter * NERDTree

" # USER FUNCTIONS AND COMMANDS
" Save session, when NERDTree is opened
fu! Savesession(fname)
    NERDTreeClose
    exec "mksession! " . a:fname
    NERDTree
endfu

command -nargs=1 SaveSession call Savesession(<f-args>)
