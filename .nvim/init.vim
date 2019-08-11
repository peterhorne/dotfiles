call plug#begin('~/.local/share/nvim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Olical/vim-enmasse'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'bogado/file-line'
Plug 'bootleq/vim-cycle'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'michaeljsmith/vim-indent-object'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-rls', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'voldikss/coc-browser', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile'}
Plug 'amiralies/coc-elixir', {'do': 'yarn install --frozen-lockfile'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'samoshkin/vim-mergetool'
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

Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'

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
set nowritebackup
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

" Cursor line
augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

hi clear CursorLine
hi clear CursorLineNr

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

" Rebind <leader>
let mapleader = " "

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

" Yank in line (skip leading space)
nnoremap yil ^y$

" Remove redundant keystrokes
nnoremap ! :!

" Jump to start/end line
noremap H ^
noremap L $

" Highlight matching parenthesis
hi! link MatchParen WarningMsg

" Configure syntax
let g:polyglot_disabled = ['markdown']
let g:markdown_syntax_conceal = 0
let g:markdown_fenced_languages = ['typescript']

" NERDTree
map g~ :e .<CR>
map g. :e %:h<CR>

let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeQuitOnOpen=1
let NERDTreeHijackNetrw=1

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

nnoremap <silent> <c-p> :FZF<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>l :BLines<CR>
nnoremap <silent> <leader>g :Rg <C-R><C-W><CR>
nnoremap <silent> <leader>h :BCommits<CR>
nnoremap <silent> <leader>f :Filetypes<CR>

" Enable per-command history.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Easymotion
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s2)

" Fugitive
" nnoremap gs :Gstatus<CR>
" nnoremap ga :Start git add . --verbose<CR><CR>
" nnoremap gr :Start git reset<CR><CR>

" Diff mappings
nnoremap <leader>dg :diffget<CR>
nnoremap <leader>dp :diffput<CR>

" delimitMate
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1

" Use ripgrep
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

" highlighted-yank
let g:highlightedyank_highlight_duration = 250
hi HighlightedyankRegion guibg=#504945

" indentLine
let g:indentLine_char = '│'

" Hide mode
set noshowmode

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" autocmd FileType typescript,typescript.tsx,javascript,javascript.jsx,ruby,elixir
autocmd FileType typescript,typescript.tsx,javascript,javascript.jsx,ruby
      \ nmap <buffer><silent> [c <Plug>(coc-diagnostic-prev)|
      \ nmap <buffer><silent> ]c <Plug>(coc-diagnostic-next)|
      \ nmap <buffer><silent> <c-]> <Plug>(coc-definition)|
      \ nmap <buffer><silent> <c-w>} :call CocAction('jumpDefinition', 'split')<CR>|
      \ nmap <buffer><silent> <c-w>] :call CocAction('jumpDefinition', 'vsplit')<CR>|
      \ nmap <buffer><silent> <c-w><c-]> :call CocAction('jumpDefinition', 'vsplit')<CR>|
      \ nmap <buffer><silent> <c-[> <Plug>(coc-type-definition)|
      \ nmap <buffer><silent> gi <Plug>(coc-implementation)|
      \ nmap <buffer><silent> gr <Plug>(coc-references)|
      \ nmap <buffer><silent> K :call CocAction('doHover')<CR>|
      \ nmap <buffer><silent> ge <Plug>(coc-diagnostic-info)|
      \ vmap ga <Plug>(coc-codeaction-selected)|
      \ nmap ga <Plug>(coc-codeaction)

" Show signature help while editing
autocmd CursorHoldI,CursorMovedI * silent! call CocActionAsync('showSignatureHelp')

command! -nargs=0 Prettier :CocCommand prettier.formatFile
" autocmd CursorHold *.ts,*.tsx,*.css Prettier
" TODO: fix conflict with delimitMate and trigger on InsertLeave too
" autocmd CursorHold,InsertLeave *.js,*.ts,*.tsx,*.css Prettier

hi SignColumn guibg=bg
hi def link CocErrorSign GruvboxRed
hi def link CocWarningSign GruvboxOrange
hi def link CocInfoSign GruvboxYellow
hi def link CocHintSign GruvboxPurple

" targets.vim
autocmd User targets#mappings#user call targets#mappings#extend({
  \ 'a': {'argument': [{'o': '[{([]', 'c': '[])}]', 's': ','}]}
  \ })

" winresizer
let g:winresizer_start_key = '<c-t>'
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1

" vim-mergetool
let g:mergetool_layout = 'mr'
let g:mergetool_prefer_revision = 'local'
nmap gm <plug>(MergetoolToggle)

" vim-cycle
let g:cycle_no_mappings = 1
nmap <silent> <c-a> <Plug>CycleNext
vmap <silent> <c-a> <Plug>CycleNext
nmap <silent> <c-x> <Plug>CyclePrev
vmap <silent> <c-x> <Plug>CyclePrev
noremap <silent> <Plug>CycleFallbackNext <c-a>
noremap <silent> <Plug>CycleFallbackPrev <c-x>

" Show line numbers
set nu

" vim-procession
nnoremap <leader>p :call fzf#run({'source': prosession#ListSessions(), 'sink': 'Prosession', 'down': '30%'})<cr>
let g:prosession_on_startup = 0
let g:prosession_default_session = 0
