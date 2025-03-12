"Vundle Package Management
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Core
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'

"Navigation
Plugin 'vim-scripts/camelcasemotion'
Plugin 'rhysd/clever-f.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'

"Language Specific
Plugin 'Blackrush/vim-gocode'
Plugin 'fatih/vim-go'
Plugin 'digitaltoad/vim-jade'
Plugin 'chase/vim-ansible-yaml'

"Aesthetics
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'paranoida/vim-airlineish'
Plugin 'vim-airline/vim-airline-themes'

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
set autoindent
set cindent
set expandtab
set encoding=utf-8
set noshowmode
nnoremap ; :
inoremap jk  <esc>
let mapleader = " "

autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype coffee setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype jade setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2

"Move cursor ignoring line wrapping
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> gj (v:count == 0 ? 'j' : 'gj')
nnoremap <expr> gk (v:count == 0 ? 'k' : 'gk')

"Split settings
set splitright
set splitbelow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Leader>k <C-W><bar>
nnoremap <Leader>j <C-W>=

"Chrome-like tab instantiation. n/b to move next/previous
nnoremap <C-t> :tabnew<CR>
nnoremap <C-b> :tabprevious<CR>
nnoremap <C-n> :tabnext<CR>
inoremap <C-t> <Esc>:tabnew<CR>
inoremap <C-b> <Esc>:tabprevious<CR>i
inoremap <C-n> <Esc>:tabnext<CR>i

"Press enter to get rid of highlighted text after search
nnoremap <CR> :noh<CR><CR>

"Jump to end of paste
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

"Clipboard Paste toggle
:set pt=<f9>

"Prevent dumb popup window
map q; :q

"Plugin Settings
map W <Plug>CamelCaseMotion_w 
map B h<Plug>CamelCaseMotion_b 
map E <Plug>CamelCaseMotion_e 
sunmap W
sunmap B
sunmap E
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

"Airline and ColorScheme"
syntax on
colorscheme badwolf
hi Normal ctermbg=None
hi NonText ctermbg=None
hi LineNr ctermbg=None
set laststatus=2
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10 
let g:airline_theme = 'airlineish'
if !exists("g:airline_symbols")
      let g:airline_symbols = {}
endif
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#empty_message  =  "No SCM"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter
