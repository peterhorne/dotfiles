" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'chriskempson/base16-vim'

" Theme
set background=dark
colorscheme base16-ocean

" Relative line numbers
set rnu

" Fast saving
nmap <leader>w :w!<cr>

" Enable syntax highlighting
syntax enable

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

" Makes search act like search in modern browsers
set incsearch

