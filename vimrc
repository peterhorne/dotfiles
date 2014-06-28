" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'

" Colour schemes + syntax files
Plugin 'altercation/vim-colors-solarized'
Plugin 'empanda/vim-varnish'
Plugin 'slim-template/vim-slim'
Plugin 'kchmck/vim-coffee-script'

call vundle#end()
filetype plugin indent on

" Theme
set background=dark
colorscheme solarized

" Enable syntax highlighting
syntax enable

" Set font
set guifont=Inconsolata\ LGC\ for\ Powerline:h12

" Always show status bar
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

" Default indent amount
set shiftwidth=2
set tabstop=2

set autoindent
set smartindent

set wrap
set showbreak="↪\ \ \ " "Highlight wrapped lines

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

" Open new splits below and to the right
set splitright
set splitbelow

" Number of lines to show around cursor
set scrolloff=5

" Navigate splits with ctrl-jklh
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Map .md file extension to markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Ignore common files/dirs
set wildignore+=*/vendor/*
set wildignore+=*/cache/*

" Show hidden files in Ctrl-P
let g:ctrlp_show_hidden = 1

" Configure Ctrl-P (show more results)
let g:ctrlp_match_window='bottom,order:btt,min:1,max:20,results:40'

" Speed up Ctrl-P for git projects
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" Disable caching for Ctrl-P
let g:ctrlp_use_caching = 0

" Toggle NERDTree with Ctrl-N
map <C-n> :NERDTreeToggle<CR>

" Find reveal file in NERDTree
map <C-m> :NERDTreeFind<CR>

" Close vim if NERDTree is the only remaining open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Simplify NERDtree
let NERDTreeMinimalUI=1

" Automatically delete buffers when deleting/renaming files in NERDTree
let NERDTreeAutoDeleteBuffer=1

" Map bidirectional easymotion find to `s`
nmap s <Plug>(easymotion-s2)

" Enable smartcase for easymotion
let g:EasyMotion_smartcase = 1

" Map Gundo to U
nnoremap U :GundoToggle<CR>

" Display Gundo preview pane under current windows
let g:gundo_preview_bottom=1

" Remove airline seperators (arrows)
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''

" Fugitive diffget mappings
nnoremap dgt :diffget //2<cr>:diffupdate<cr>
nnoremap dgm :diffget //3<cr>:diffupdate<cr>

