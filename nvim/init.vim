call plug#begin('~/.vim/plugged')
Plug 'raimondi/delimitmate'
Plug 'sickill/vim-monokai'
Plug 'justinmk/vim-syntax-extra'
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'tomasr/molokai'
call plug#end()

" Vim airlines
let g:airline_theme='onedark'

" Rust
let g:rustfmt_autosave = 1

" Syntax
syntax enable
syntax on

set termguicolors
colorscheme molokai


" Tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Transparent background
highlight Normal guibg=none
highlight NonText guibg=none

" Display line numbers
highlight LineNr guibg=none 
set number

" Search
set ignorecase
nmap qq :nohl<CR>

" Map escape to jj
" Experimental
imap jj <Esc>

" Remap write
nmap s :w<CR>

" More than 80 chars is bad
" Show a ruller on toggle
nmap qc :let &cc = &cc == '' ? '79' : ''<CR>

" Remap page moves
" Avoid scrolling one line by one line
nmap <C-J> }
nmap <C-K> {

" Switch buffers with ctrl+h/l
nmap <C-H> :bprev<CR>
nmap <C-L> :bprev<CR>

" Completion
" Ale with airline
let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled = 1
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
