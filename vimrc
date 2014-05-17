" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'

" Theme
set background=dark
colorscheme solarized

" Enable syntax highlighting
syntax enable

" Set font
set guifont=Inconsolata\ LGC\ for\ Powerline:h12

" Highlight current line
set cul

" Line numbers
set nu

" Use semicolon instead of colon
nore ; :

" Yank and paste using system clipboard
set clipboard=unnamed

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Turn backup off
set nobackup
set nowb
set noswapfile

set incsearch       " Makes search act like search in modern browsers
set ignorecase      " Ignore case when using a search pattern
set smartcase       " Override 'ignorecase' when pattern
                    " has upper case character

" Fix backspace
set backspace=indent,eol,start

" Number of lines to show around cursor
set scrolloff=5

" Navigate splits with ctrl-jklh
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Resize splits with alt-jklh
map ˚ <C-W>-
map ∆ <C-W>+
map ˙ <C-W>>
map ¬ <C-W><

