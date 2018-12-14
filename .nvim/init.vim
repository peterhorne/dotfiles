call plug#begin('~/.local/share/nvim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Olical/vim-enmasse'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'bogado/file-line'
Plug 'easymotion/vim-easymotion'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'michaeljsmith/vim-indent-object'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'do': 'yarn install'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

Plug 'wellle/targets.vim'

call plug#end()

" Make vim pretty
set termguicolors
set background=dark
colorscheme gruvbox
let g:gruvbox_italic=1
syntax enable

" Enable mouse support (useful for resizing windows)
set mouse=a

" Enable spell checking
set spell

" Always show signs
set signcolumn=yes

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

" Trigger CursorHold autocommand sooner
set updatetime=500

" Improve suggestions UI
set completeopt=menuone,preview

" Status line
hi StatusLine gui=NONE guibg=bg guifg=#928374
hi StatusLineNC gui=NONE guibg=bg guifg=#928374
set statusline=\ %f\ %h%w%m%r\ 
set fillchars+=stl:·
set fillchars+=stlnc:·

" Don't skip wrapped lines
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k

" Rebind <Leader>
" let mapleader = " "

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

" Why isn't this default?
nnoremap Y y$

" Highlight matching parenthesis
hi! link MatchParen WarningMsg


" Configure syntax
let g:polyglot_disabled = ['markdown']
let g:markdown_syntax_conceal = 0
let g:markdown_fenced_languages = ['typescript']

" Add support for jsx/tsx files
au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
au BufNewFile,BufRead *.tsx set filetype=typescript.tsx

" NERDTree
map <Leader>n :NERDTree<CR>
map <Leader><Leader>n :NERDTreeFind<CR>

let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeQuitOnOpen=1

" FZF
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'GruvboxFg3'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'GruvboxBg0'],
  \ 'hl+':     ['fg', 'GruvboxBlue'],
  \ 'info':    ['fg', 'PFolded'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Normal'],
  \ 'pointer': ['fg', 'GruvboxPurple'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

function! s:fzf_statusline()
  setlocal statusline=·
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

nnoremap <silent> <C-p> :FZF<CR>
nnoremap <silent> <Leader>a :Rg<CR>

" Enable per-command history.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Ignore filenames when searcing
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4.. '}, <bang>0)

" Easymotion
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s2)

" Fugitive
" nnoremap gs :Gstatus<CR>
" nnoremap ga :Start git add . --verbose<CR><CR>
" nnoremap gr :Start git reset<CR><CR>

" Fugitive diffget mappings
nnoremap dgt :diffget //2<CR>:diffupdate<CR>
nnoremap dgm :diffget //3<CR>:diffupdate<CR>

" delimitMate
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1

" Use ripgrep
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

" highlighted-yank
let g:highlightedyank_highlight_duration = 250
hi HighlightedyankRegion guibg=#504945

" bufexplorer
let g:bufExplorerDefaultHelp = 0
let g:bufExplorerShowRelativePath = 1
let g:bufExplorerSplitOutPathName = 0

" indentLine
let g:indentLine_char = '│'

" Hide mode
set noshowmode

" Use tab for trigger completion with characters ahead and navigate.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <C-p> to complete 'word', 'emoji' and 'include' sources
" imap <silent> <C-p> <Plug>(coc-complete-custom)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> for confirm completion.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

autocmd FileType typescript,typescript.tsx
      \ nmap <silent> [c <Plug>(coc-diagnostic-prev)|
      \ nmap <silent> ]c <Plug>(coc-diagnostic-next)|
      \ nmap <silent> <c-]> <Plug>(coc-definition)|
      \ nmap <silent> <c-[> <Plug>(coc-type-definition)|
      \ nmap <silent> gi <Plug>(coc-implementation)|
      \ nmap <silent> gr <Plug>(coc-references)|
      \ nmap <silent> K :call <SID>show_documentation()<CR>|
      \ nmap <silent> ge <Plug>(coc-diagnostic-info)|
      \ vmap ga <Plug>(coc-codeaction-selected)|
      \ nmap ga <Plug>(coc-codeaction)

function! s:show_documentation()
  call CocAction('doHover')
  " nnoremap <silent> K :call <SID>hide_documentation()<CR>
endfunction

" function! s:hide_documentation()
"   exec "pclose"
"   nnoremap <silent> K :call <SID>show_documentation()<CR>
" endfunction

" Show signature help while editing
autocmd CursorHoldI,CursorMovedI * silent! call CocAction('showSignatureHelp')

command! -nargs=0 Prettier :CocCommand prettier.formatFile
" autocmd CursorHold *.ts,*.tsx,*.css Prettier
" TODO: fix conflict with delimitMate and trigger on InsertLeave too
" autocmd CursorHold,InsertLeave *.js,*.ts,*.tsx,*.css Prettier

hi SignColumn guibg=bg
hi def link CocErrorSign GruvboxRed
hi def link CocWarningSign GruvboxOrange
hi def link CocInfoSign GruvboxYellow
hi def link CocHintSign GruvboxPurple

" Use fzf when there are multiple 'jump to definition' targets
let g:coc_auto_copen = 0
autocmd User CocQuickfixChange :call fzf_quickfix#run()

" targets.vim
autocmd User targets#mappings#user call targets#mappings#extend({
  \ 'a': {'argument': [{'o': '[{([]', 'c': '[])}]', 's': ','}]}
  \ })
