" Vundle Package Management
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Core
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'

"Specific
Plugin 'Raimondi/delimitMate'
Plugin 'Blackrush/vim-gocode'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'

"Aesthetics
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'paranoida/vim-airlineish'

call vundle#end()
filetype plugin indent on

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
set autoindent
set cindent
set expandtab
set encoding=utf-8
set noshowmode

autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype coffee setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2

"Advanced Settings
let mapleader = " "
nmap <c-a> :TagbarToggle<CR>
let g:ctrlp_show_hidden = 1
filetype on
filetype plugin on
filetype indent on
nnoremap ; :
inoremap jk  <esc>
nmap <leader>n :NERDTreeToggle<CR>

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
nnoremap <C-N> :tabprevious<CR>
nnoremap <C-n> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
inoremap <C-N> <Esc>:tabprevious<CR>i
inoremap <C-n> <Esc>:tabnext<CR>i
inoremap <C-t> <Esc>:tabnew<CR>

"Press enter to get rid of highlighted text after search
nnoremap <CR> :noh<CR><CR>

"Jump to end of paste
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

"Paste toggle"
:set pt=<f9>

"Airline and ColorScheme"
syntax on
colorscheme badwolf
hi Normal ctermbg=NONE
set laststatus=2
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10 
let g:airline_theme = 'airlineish'
if !exists("g:airline_symbols")
      let g:airline_symbols = {}
endif

let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
let g:airline_section_warning = airline#section#create([ "syntastic" ])
let g:airline#extensions#branch#empty_message  =  "No SCM"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#syntastic#enabled     =  1
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter
