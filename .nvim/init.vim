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
Plug 'meain/vim-printer'
Plug 'michaeljsmith/vim-indent-object'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'samoshkin/vim-mergetool'
Plug 'scrooloose/nerdtree'
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
Plug 'wuelnerdotexe/vim-astro', {'branch':'main'}
Plug 'nvim-treesitter/nvim-treesitter-context'

call plug#end()
let &runtimepath.=',~/src/colours'

syntax enable
colorscheme phk

call coc#add_extension('coc-tsserver', 'coc-json', 'coc-rls', 'coc-css', 'coc-prettier', 'coc-solargraph', '@yaegassy/coc-astro', 'coc-elixir')

lua << EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "markdown",
      "markdown_inline",
      "typescript",
      "javascript",
      "ruby",
    },

    auto_install = true,

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    }
  }
EOF

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

" Status line
set fillchars=stl:\─,stlnc:\─,vert:\│,eob:¬

function! s:active_statusline()
  setlocal statusline=\─\─\ %#Normal#%f\ %h%w%m%r%*
endfunction

function! s:inactive_statusline()
  setlocal statusline=\─\─\ %f\ %h%w%m%r%*
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
autocmd FileType ivan setlocal commentstring=;%s

" Register LLVM IR filetype
autocmd BufRead,BufNewFile *.ll set filetype=llvm
autocmd FileType llvm setlocal commentstring=;%s

" Register protobuf comment type
autocmd FileType proto setlocal commentstring=//%s

" Highlight matching parenthesis
" hi! link MatchParen WarningMsg

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
set grepprg=rg\ --vimgrep\ --smart-case\ --max-columns=0
nnoremap <leader>r :Rg 

" highlighted-yank
let g:highlightedyank_highlight_duration = 200

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
  \ 'elixir': 'IO.inspect({$}, label: "== {$}")',
\ }

" Show all matches while searching
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? let g:hlsearch_before_search = &hlsearch | set hlsearch
  autocmd CmdlineLeave /,\? let &hlsearch = g:hlsearch_before_search
augroup END

lua << EOF
  require'treesitter-context'.setup({
    -- Enable this plugin (Can be enabled/disabled later via commands)
    enable = true,

    -- Enable multiwindow support.
    multiwindow = true,

    -- How many lines the window should span. Values <= 0 mean no limit.
    max_lines = 4,

    -- Minimum editor window height to enable context. Values <= 0 mean no
    -- limit.
    min_window_height = 40,

    -- Whether to show line numbers
    line_numbers = true,

    -- Maximum number of lines to show for a single context
    multiline_threshold = 20,

    -- Which context lines to discard if `max_lines` is exceeded.
    -- Choices: 'inner', 'outer'
    trim_scope = 'inner',

    -- Line used to calculate context.
    -- Choices: 'cursor', 'topline'
    mode = 'topline',

    -- Separator between context and content. Should be a single character
    -- string, like '-'. When separator is set, the context will only show
    -- up when there are at least 2 lines above cursorline.
    separator = '·',

    -- The Z-index of the context window
    zindex = 20,

    -- (fun(buf: integer): boolean) return false to disable attaching
    on_attach = nil,
  })
EOF

" TreesitterContext highlight links now live in the phk colorscheme
" (see ~/src/colours/template/phk.erb), so they survive colorscheme reloads.

set scrolloff=5
