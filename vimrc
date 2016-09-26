" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'benekastah/neomake'
" Plugin 'bling/vim-airline'
Plugin 'bogado/file-line'
Plugin 'dyng/ctrlsf.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/fzf.vim'
Plugin 'mattboehm/vim-accordion'
Plugin 'mattn/emmet-vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'peterhorne/tabline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ton/vim-bufsurf'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'

" Plugin 'justinmk/vim-sneak'

" Colour schemes + syntax files
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'empanda/vim-varnish'
Plugin 'kchmck/vim-coffee-script'
Plugin 'morhetz/gruvbox'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'rust-lang/rust.vim'
Plugin 'slim-template/vim-slim'
Plugin 'vim-scripts/nginx.vim'

call vundle#end()
filetype plugin indent on

" FZF
set rtp+=/usr/local/opt/fzf
nnoremap <C-p> :FZF --history /tmp/fzf_history<CR>

" Theme
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark="soft"

" Enable syntax highlighting
syntax enable

" Enable JSX in JS files
let g:jsx_ext_required = 0

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

set wrap
set breakindent

" Turn backup off
set nobackup
set nowb
set noswapfile

set nohlsearch " Don't highlight search results
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

" Navigate splits with ctrl-jklh
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Navigate splits when in NeoVim's :terminal
tnoremap <ESC> <c-\><c-n>
" tnoremap <c-j> <c-\><c-n><c-w>j
" tnoremap <c-k> <c-\><c-n><c-w>k
" tnoremap <c-l> <c-\><c-n><c-w>l
" tnoremap <c-h> <c-\><c-n><c-w>h

" Switch to insert mode when entering :terminal
autocmd BufWinEnter,WinEnter term://* startinsert

" Navigate tabs
noremap ∆ gT
noremap ˚ gt
noremap † :tabnew<CR>
noremap œ :tabclose<CR>

" Map to trigger sudo prompt
cmap w!! %!sudo tee > /dev/null %

" Map .md file extension to markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Map .es6 file extension to javascript
autocmd BufNewFile,BufReadPost *.es6 set filetype=javascript

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

map <Leader>n :NERDTree<CR>
map <Leader><Leader>n :NERDTreeFind<CR>

" Close vim if NERDTree is the only remaining open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Simplify NERDTree
let NERDTreeMinimalUI=1

" Automatically delete buffers when deleting/renaming files in NERDTree
let NERDTreeAutoDeleteBuffer=1

" Close NERDTree when opening file
let NERDTreeQuitOnOpen=1

" Enable smartcase for easymotion
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s2)

" Remove airline seperators (arrows)
" let g:airline_left_sep=''
" let g:airline_right_sep=''
" let g:airline_section_z=''

" Fugitive
nnoremap gs :Gstatus<CR>
nnoremap ga :Start git add . --verbose<CR><CR>
nnoremap gr :Start git reset<CR><CR>

" Fugitive diffget mappings
nnoremap dgt :diffget //2<CR>:diffupdate<CR>
nnoremap dgm :diffget //3<CR>:diffupdate<CR>

" BufSurf mappings
map <Leader>b :BufSurfBack<CR>
map <Leader>f :BufSurfForward<CR>

" delimitMate
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1

" vim-dispatch
autocmd FileType markdown let b:dispatch = 'octodown %'
autocmd FileType rust let b:dispatch = 'cargo run'
map <Leader>d :Dispatch<CR>:copen<CR><C-w><C-p>

" Tab bar colours
" hi TabLine      ctermfg=Black  ctermbg=DarkGrey  cterm=NONE
" hi TabLineFill  ctermfg=Black  ctermbg=DarkGrey  cterm=NONE
" hi TabLineSel   ctermfg=White     ctermbg=DarkGrey  cterm=NONE

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0

" let g:syntastic_javascript_checkers = ["eslint"]

" map <Leader>c :SyntasticCheck<CR>

" Neomake
let g:neomake_error_sign = { 'text': 'E>', 'texthl': 'GruvboxRedSign' }
let g:neomake_warning_sign = { 'text': 'W>', 'texthl': 'GruvboxYellowSign' }
autocmd! BufWinEnter * Neomake
autocmd! BufWritePost * Neomake

" vim-multiple-cursors mappings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Run maxitest
nnoremap <Leader>t :sp term://mtest\ %:<C-r>=line('.')<CR><CR>

" Ag
set grepprg=ag\ --nogroup\ --nocolor
command! -nargs=+ -complete=file -bar AgGrep silent! grep! <args>|cwindow|redraw!
nnoremap <Leader>a :AgGrep 

" Position quickfix list fullwidth at bottom of screen
autocmd FileType qf wincmd J

" Always render sign column
autocmd BufEnter * sign define dummy 
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" hi clear StatusLine
" hi clear StatusLineNC
" hi StatusLine   term=bold cterm=bold ctermfg=White ctermbg=235
" hi StatusLineNC term=bold cterm=bold ctermfg=White ctermbg=235

" " highlight values in terminal vim, colorscheme solarized
" hi User1                      ctermfg=4          guifg=#40ffff            " Identifier
" hi User2                      ctermfg=2 gui=bold guifg=#ffff60            " Statement
" hi User3 term=bold cterm=bold ctermfg=1          guifg=White   guibg=Red  " Error
" hi User4                      ctermfg=1          guifg=Orange             " Special
" hi User5                      ctermfg=10         guifg=#80a0ff            " Comment
" hi User6 term=bold cterm=bold ctermfg=1          guifg=Red                " WarningMsg

" set statusline=
" set statusline+=%6*%m%r%*                          " modified, readonly
" set statusline+=\ 
" set statusline+=%5*%{expand('%:h')}/               " relative path to file's directory
" set statusline+=%1*%t%*                            " file name
" set statusline+=\ 
" set statusline+=\ 
" set statusline+=%<                                 " truncate here if needed
