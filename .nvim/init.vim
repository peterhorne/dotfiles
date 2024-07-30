call plug#begin('~/.local/share/nvim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Olical/vim-enmasse'
Plug 'Raimondi/delimitMate'
Plug 'bogado/file-line'
Plug 'bootleq/vim-cycle'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'michaeljsmith/vim-indent-object'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'samoshkin/vim-mergetool'
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
Plug 'meain/vim-printer'
Plug 'morhetz/gruvbox'
Plug 'wuelnerdotexe/vim-astro', {'branch':'main'}

call plug#end()

call coc#add_extension('coc-tsserver', 'coc-json', 'coc-rls', 'coc-css', 'coc-prettier', 'coc-solargraph', 'coc-elixir', '@yaegassy/coc-astro')


" Make vim pretty
syntax enable
set background=dark
colorscheme gruvbox

" Enable mouse support (useful for resizing windows)
set mouse=a

" Enable spell checking
set spell

" Always show signs
set signcolumn=yes

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

" Disable CursorLine for better performance
" hi clear CursorLine
hi clear LineNr
hi link LineNr Comment
hi clear CursorLineNr
hi clear SignColumn

" Status line
" StatusLine and StatusLineNC have different guibg
" set to prevent vim replacing fillchars with "^^^"
hi clear StatusLine
hi clear StatusLineNC
hi clear VertSplit
hi StatusLine guibg=black
hi StatusLineNC guibg=white
set fillchars=stl:\─,stlnc:\─,vert:\│,eob:¬

function! s:active_statusline()
  setlocal statusline=\─\─\ %1*%f\ %h%w%m%r%*
endfunction

function! s:inactive_statusline()
  setlocal statusline=\─\─\ %2*%f\ %h%w%m%r%*
endfunction

augroup statusline
    autocmd!
    autocmd WinEnter * call <SID>active_statusline()
    autocmd WinLeave * call <SID>inactive_statusline()
augroup END

call <SID>active_statusline()

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

" Register ivan filetype
autocmd BufRead,BufNewFile *.iv set filetype=ivan

" Highlight matching parenthesis
hi! link MatchParen WarningMsg

" NERDTree
map g~ :e .<CR>
map g. :e %:h<CR>

let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeQuitOnOpen=1
let NERDTreeHijackNetrw=1

" FZF
function! s:fzf_statusline()
  setlocal statusline=\ 
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

nnoremap <silent> <c-p> :FZF<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>l :BLines<CR>
nnoremap <silent> <leader>g :Rg <C-R><C-W><CR>
nnoremap <silent> <leader>h :BCommits<CR>

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
nnoremap <leader>r :Rg 

" highlighted-yank
let g:highlightedyank_highlight_duration = 250
hi HighlightedyankRegion guibg=#504945

" indentLine
let g:indentLine_char = '│'

" Hide mode
set noshowmode

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

autocmd FileType typescript,typescriptreact,javascript,javascriptreact,ruby,elixir,astro,ivan
      \ nmap <buffer><silent> [c <Plug>(coc-diagnostic-prev)|
      \ nmap <buffer><silent> ]c <Plug>(coc-diagnostic-next)|
      \ nmap <buffer><silent> <c-]> <Plug>(coc-definition)|
      \ nmap <buffer><silent> <c-w>} :call CocAction('jumpDefinition', 'split')<CR>|
      \ nmap <buffer><silent> <c-w>] :call CocAction('jumpDefinition', 'vsplit')<CR>|
      \ nmap <buffer><silent> <c-w><c-]> :call CocAction('jumpDefinition', 'vsplit')<CR>|
      \ nmap <buffer><silent> gt <Plug>(coc-type-definition)|
      \ nmap <buffer><silent> gi <Plug>(coc-implementation)|
      \ nmap <buffer><silent> gr <Plug>(coc-references-used)|
      \ nmap <buffer><silent> K :call CocAction('doHover')<CR>|
      \ nmap <buffer><silent> ge <Plug>(coc-diagnostic-info)|
      \ vmap ga <Plug>(coc-codeaction-selected)|
      \ nmap ga <Plug>(coc-codeaction)|
      \ nmap gn <Plug>(coc-rename)
      " \ nmap <silent> <C-d> <Plug>(coc-range-select)|
      " \ xmap <silent> <C-d> <Plug>(coc-range-select)

" Show signature help while editing
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

nmap <silent> <leader>f :call CocActionAsync('runCommand', 'prettier.formatFile')<CR>

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

" vim-smoothie
let g:smoothie_base_speed = 16
let g:smoothie_update_interval = 1

" vim-printer
let g:vim_printer_items = {
  \ 'javascript': 'console.log("== {$}", {$})',
  \ 'javascriptreact': 'console.log("== {$}", {$})',
  \ 'typescript': 'console.log("== {$}", {$})',
  \ 'typescriptreact': 'console.log("== {$}", {$})',
  \ 'astro': 'console.log("== {$}", {$})',
  \ 'ruby': 'puts "== {$}", {$}',
\ }
