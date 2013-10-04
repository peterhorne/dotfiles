" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'chriskempson/base16-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'airblade/vim-gitgutter'

" Theme
" set background=dark
" colorscheme base16-solarized

" Enable syntax highlighting
syntax enable

" Highlight current line
set cul

" Relative line numbers
set rnu

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

" Number of lines to show around cursor
set scrolloff=3

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

