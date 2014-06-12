" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

filetype plugin on

" Theme
set background=dark
colorscheme solarized

" Enable syntax highlighting
syntax enable

" Set font
set guifont=Inconsolata\ LGC\ for\ Powerline:h12

" Always show status bar (powerline)
set laststatus=2

" Enable mouse support (useful for resizing windows)
set mouse=a

" Highlight current line
set cul

" Line numbers
set nu

" Enable hidden buffers (navigate away from buffer with unsaved changes)
set hidden

" Yank and paste using system clipboard
set clipboard=unnamed

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai   "Auto indent
set si   "Smart indent
set wrap "Wrap lines

" Turn backup off
set nobackup
set nowb
set noswapfile

set incsearch  " Makes search act like search in modern browsers
set ignorecase " Ignore case when using a search pattern
set smartcase  " Override 'ignorecase' when pattern
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

" Configure Ctrl-P (show at top of window)
let g:ctrlp_match_window='top,order:ttp,min:1,max:4,results:20'

" Add a space after NERDComments
let NERDSpaceDelims=1

" Toggle NERDTree with Ctrl-N
map <C-n> :NERDTreeToggle<CR>

