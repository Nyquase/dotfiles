call plug#begin('~/.vim/plugged')
Plug 'raimondi/delimitmate'
Plug 'sickill/vim-monokai'
Plug 'justinmk/vim-syntax-extra'
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Vim airlines
let g:airline_powerline_fonts = 1
let g:airline_theme='raven'

" Rust
let g:rustfmt_autosave = 1

" Syntax
syntax enable
syntax on
colorscheme monokai

" Tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Display line numbers
highlight LineNr ctermbg=none 
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

" Transparent background
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" .ini mode for config files
autocmd BufRead,BufNewFile *.conf setf dosini
