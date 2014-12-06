" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Lokaltog/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'chrisbra/vim-show-whitespace'
Plugin 'gmarik/Vundle.vim'
Plugin 'joonty/vdebug'
Plugin 'kien/ctrlp.vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ton/vim-bufsurf'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'

" Colour schemes + syntax files
Plugin 'altercation/vim-colors-solarized'
Plugin 'empanda/vim-varnish'
Plugin 'kchmck/vim-coffee-script'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

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

" Highlight 80th column
set colorcolumn=80

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
set breakindent

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
set scrolloff=3

" Hide current mode in command bar
set noshowmode

" Navigate splits with ctrl-jklh
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Navigate tabs
noremap ∆ gT
noremap ˚ gt
noremap † :tabnew<CR>
noremap œ :tabclose<CR>

" Matching braces
inoremap {<CR> {<CR>}<Esc>O
inoremap (<CR> (<CR>)<Esc>O
inoremap [<CR> [<CR>]<Esc>O

" Move cursor after matching brace
inoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a
inoremap <C-k> <Esc>?[({"'[<]<CR>:nohl<CR>i

" Map to trigger sudo prompt
cmap w!! %!sudo tee > /dev/null %

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
map <C-n> :e .<CR>

" Reveal file in NERDTree
map <C-m> :e %:h<CR>

" Close vim if NERDTree is the only remaining open window
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Simplify NERDtree
let NERDTreeMinimalUI=1

" Automatically delete buffers when deleting/renaming files in NERDTree
let NERDTreeAutoDeleteBuffer=1

" " Map bidirectional easymotion find to `s`
" nmap s <Plug>(easymotion-s2)

" " Enable smartcase for easymotion
" let g:EasyMotion_smartcase = 1

" Remove airline seperators (arrows)
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''

" Fugitive diffget mappings
nnoremap dgt :diffget //2<CR>:diffupdate<CR>
nnoremap dgm :diffget //3<CR>:diffupdate<CR>

" BufSurf mappings
map <Leader>b :BufSurfBack<CR>
map <Leader>f :BufSurfForward<CR>

" Vdebug config
let g:vdebug_options= {"port" : 9001}

" Highlight spaces
let g:showwhite_highlighting = 'ctermfg=10 ctermbg=NONE guifg=LightGrey guibg=NONE'
