call plug#begin('~/.local/share/nvim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'benekastah/neomake'
Plug 'bogado/file-line'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf.vim'
Plug 'mhartington/nvim-typescript', { 'do': ':UpdateRemotePlugins' }
Plug 'michaeljsmith/vim-indent-object'
Plug 'morhetz/gruvbox'
Plug 'ntpeters/vim-better-whitespace'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'ton/vim-bufsurf'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'


call plug#end()

" FZF
set rtp+=/usr/local/opt/fzf
nnoremap <C-p> :FZF --history /tmp/fzf_history<CR>

" Make vim pretty
set termguicolors
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark="soft"
let g:gruvbox_italic=1
syntax enable

" Always show status bar
set laststatus=2

" Enable mouse support (useful for resizing windows)
set mouse=a

" Enable spell checking
set spell

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

" Default indent (2 spaces)
set shiftwidth=2
set tabstop=2
set shiftround

set autoindent
set smartindent

" Line wrapping
set wrap
set breakindent

" Turn backup/swap files off
set nobackup
" set nowb
set noswapfile

" Ergonomic search
set nohlsearch
set incsearch
set ignorecase
set smartcase

" Fix backspace
set backspace=indent,eol,start

" Open new splits below and to the right
set splitright
set splitbelow

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

" Always render sign column
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" NERDTree
map <Leader>n :NERDTree<CR>
map <Leader><Leader>n :NERDTreeFind<CR>

let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeQuitOnOpen=1

" Ag
set grepprg=ag\ --nogroup\ --nocolor
command! -nargs=+ -complete=file -bar AgGrep silent! grep! <args>|cwindow|redraw!
nnoremap <Leader>a :AgGrep 

" Easymotion
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s2)

" Fugitive
nnoremap gs :Gstatus<CR>
nnoremap ga :Start git add . --verbose<CR><CR>
nnoremap gr :Start git reset<CR><CR>

" Fugitive diffget mappings
nnoremap dgt :diffget //2<CR>:diffupdate<CR>
nnoremap dgm :diffget //3<CR>:diffupdate<CR>

" BufSurf
map <Leader>b :BufSurfBack<CR>
map <Leader>f :BufSurfForward<CR>

" delimitMate
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1

" Neomake
let g:neomake_error_sign = { 'text': '•', 'texthl': 'GruvboxRedSign' }
let g:neomake_warning_sign = { 'text': '•', 'texthl': 'GruvboxYellowSign' }
autocmd! BufWinEnter * Neomake
autocmd! BufWritePost * Neomake

" deoplete
let g:deoplete#enable_at_startup = 1

" nvim-typescript
augroup filetypedetect
    au BufRead,BufNewFile __doc__ setfiletype typescript
augroup END

nmap <leader>d :TSType<CR>
nmap <leader><leader>d :TSDefPreview<CR>

" Neoformat
autocmd BufWinEnter,BufWrite,CursorHold *.js,*.ts,*.tsx,*.css Neoformat
