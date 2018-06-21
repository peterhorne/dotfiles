call plug#begin('~/.local/share/nvim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer --rust-completer' }
Plug 'Yggdroot/indentLine'
Plug 'bogado/file-line'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf.vim'
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
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

Plug 'machakann/vim-highlightedyank'
Plug 'jlanzarotta/bufexplorer'

call plug#end()

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

" Ergonomic substitution
set gdefault
set inccommand=nosplit

" Fix backspace
set backspace=indent,eol,start

" Open new splits below and to the right
set splitright
set splitbelow

" Improve suggestions UI
set completeopt=menuone,preview

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

" Faster scrolling
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

" Configure syntax
let g:polyglot_disabled = ['markdown']
let g:markdown_syntax_conceal = 0
let g:markdown_fenced_languages = ['typescript']

" NERDTree
map <Leader>n :NERDTree<CR>
map <Leader><Leader>n :NERDTreeFind<CR>

let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeQuitOnOpen=1

" FZF
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'GruvboxFg3'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'GruvboxBlue'],
  \ 'info':    ['fg', 'PFolded'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Normal'],
  \ 'pointer': ['fg', 'GruvboxPurple'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nnoremap <C-p> :FZF<CR>
nnoremap <Leader>a :Ag<CR>

" Enable per-command history.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Ignore filenames when searcing
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4.. '}, <bang>0)

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

" bufsurf (autocmd used to overwrite vim-unimpaired bindings)
autocmd VimEnter * noremap [b :BufSurfBack<CR>
autocmd VimEnter * noremap ]b :BufSurfForward<CR>

" delimitMate
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1

" Ale
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_echo_msg_format = '[%linter%] %s'

" YouCompleteMe
let g:ycm_error_symbol = '•'
let g:ycm_error_symbol = '•'
let g:ycm_autoclose_preview_window_after_completion = 1

augroup peter#ycm#typescript
  autocmd!
  autocmd FileType javascript,rust,typescript nnoremap <buffer> K :YcmCompleter GetType<CR>
  autocmd FileType javascript,rust,typescript nnoremap <buffer> <C-]> :YcmCompleter GoTo<CR>
  autocmd FileType javascript,rust,typescript nnoremap <buffer> <C-w><C-]> :split<CR> :YcmCompleter GoTo<CR>
  autocmd FileType javascript,rust,typescript nnoremap <buffer> <C-^> :YcmCompleter GoToReferences<CR>
  autocmd FileType javascript,rust,typescript nnoremap <buffer> <leader>f :YcmCompleter FixIt<CR>
augroup END

" Always render sign column
augroup peter#sign
  autocmd!
  autocmd BufEnter * sign define dummy
  autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
augroup END

" indentLine
let g:indentLine_char = '│'

" Neoformat
let g:neoformat_sql_sqlformat = {
      \ 'exe': 'sqlformat',
      \ 'args': ['--keywords upper --identifiers lower --wrap_after 80 --reindent', '-'],
      \ 'stdin': 1,
      \ }

" echodoc
set noshowmode
let g:echodoc#enable_at_startup = 1

" patch YCM to fix delimitMate
" https://github.com/Valloric/YouCompleteMe/issues/2696
imap <silent> <BS> <C-R>=YcmOnDeleteChar()<CR><Plug>delimitMateBS
function! YcmOnDeleteChar()
  if pumvisible()
    return "\<C-y>"
  endif
  return ""
endfunction

" Use ripgrep
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

" highlighted-yank
let g:highlightedyank_highlight_duration = 250

" bufexplorer
let g:bufExplorerDefaultHelp = 0
let g:bufExplorerShowRelativePath = 1
let g:bufExplorerSplitOutPathName = 0
