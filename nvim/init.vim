call plug#begin('~/.vim/plugged')
Plug 'raimondi/delimitmate'
Plug 'justinmk/vim-syntax-extra'
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'tomasr/molokai'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

" Ultisnip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsSnippetDir="/home/nyquase/.config/nvim/UltiSnips"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
filetype plugin indent on

" Vim airlines
let g:airline_theme='onedark'

" Rust
let g:rustfmt_autosave = 1

" Syntax
syntax enable
syntax on

" Colors
set termguicolors
colorscheme molokai

" Change to other buffers without saving
set hidden

" Tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Transparent background
highlight Normal guibg=none
highlight NonText guibg=none
highlight LineNr guibg=none 

" Display relative line numbers
" Screen begin to scroll 3 lines from the top/bottom
set rnu
set scrolloff=3
" Auto change to relative in normal mode and notrelative in insert mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

" Binding to toggle number mode between relative and not relative
nmap <silent><C-N> :let &rnu = (&rnu ? 0 : 1)<CR>

" I keep pressing this by mistake but don't really use it
nmap q <Nop>

" Search
set ignorecase
nmap qq :nohl<CR>

" Map escape to jj
imap jj <Esc>

" Remap write
nmap s :w<CR>

" More than 80 chars is bad
" Show a ruller on toggle
nmap qc :let &cc = (&cc == '' ? '79' : '')<CR>

" Remap page moves
" Avoid scrolling one line by one line
nmap <C-J> }
nmap <C-K> {

" Switch buffers with ctrl+h/l
nmap <C-H> :bprev<CR>
nmap <C-L> :bprev<CR>

" Nerdtree
map <C-g> :NERDTreeToggle<CR>
let NERDTreeMapActivateNode='l'
" Open NerdTree when no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if Nerdtree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Completion
" Ale with airline
let g:airline#extensions#ale#enabled = 1
"let g:airline#extensions#tabline#enabled = 1
let g:ale_lint_delay = 500
high ALEErrorSign guibg=NONE guifg=red
high ALEWarningSign guibg=NONE guifg=yellow
" Left column transparent
set signcolumn=yes
hi clear SignColumn

let g:ale_set_highlights = 0
"
"Linters to use
"If nothing is precised, the default linters are used
let g:ale_linters={
      \'javascript': ['eslint'],
      \'c': ['clang'],
      \'cpp': ['clang'],
      \'rust': ['rustc'],
      \}

"Ale C/C++ linting
"Use basic flags
"More specific flags should be provided on a project basis
"by using a local .nvimrc at projet root re-exporting these variables
let g:ale_c_clang_options='-Wall -Wextra -Wshadow --std=gnu11 -O0'
let g:ale_cpp_clang_options='-Wall -Wextra -Wshadow --std=gnu++17 -O0'

" .ini mode for config files
autocmd BufRead,BufNewFile *.conf setf dosini
