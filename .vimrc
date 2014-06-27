"Basic Configs
set number
set tabstop=4 shiftwidth=4 expandtab
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set noswapfile
set nobackup
set backspace=2
set hidden
set wildmenu
set scrolloff=4
set tags=./tags;/
set splitright
set splitbelow

"Advanced Configs
set autoindent 
set cindent 
set expandtab
filetype on
filetype plugin on
filetype indent on
nnoremap ; :
inoremap jk  <esc>
let mapleader = " "

"Save Hotkey
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a
:imap <c-s> <Esc><c-s>

"Move Cursor By Lines
nnoremap j gj
nnoremap k gk
nnoremap H 0
nnoremap L $

"Change ctrl+hjkl keys to switch between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Chrome-like navigation
nnoremap <C-b> :tabprevious<CR>
nnoremap <C-n> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
inoremap <C-p> <Esc>:tabprevious<CR>i
inoremap <C-n> <Esc>:tabnext<CR>i
inoremap <C-t> <Esc>:tabnew<CR>

"This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>

"Jump to end of paste"
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

"Paste toggle"
:set pt=<f9>
