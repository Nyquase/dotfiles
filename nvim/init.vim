call plug#begin('~/.config/nvim/plugged')
Plug 'raimondi/delimitmate'             " Automatic (), {}, [] closing
Plug 'justinmk/vim-syntax-extra'        " Syntax highlight in C

" Color shemes
Plug 'tomasr/molokai'
Plug 'drewtempelmeyer/palenight.vim'

" Nice icons
Plug 'ryanoasis/vim-devicons'
set encoding=UTF-8

" Display vertical line for indentation levels
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '|'

" Rust
Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" File explorer
Plug 'scrooloose/nerdtree'
map <C-g> :NERDTreeToggle<CR>
let NERDTreeMapActivateNode='l'
" Open NerdTree when no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if Nerdtree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsSnippetDir="$HOME/.config/nvim/UltiSnips"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
filetype plugin indent on


" Linter
Plug 'w0rp/ale'
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_delay = 500
let g:ale_set_highlights = 0
let g:ale_linters={
      \'javascript': ['eslint'],
      \'c': ['clang'],
      \'cpp': ['clang'],
      \'rust': ['rustc'],
      \}
"More specific flags should be provided on a project basis
"by using a local .nvimrc at projet root re-exporting these variables
let g:ale_c_clang_options='-Wall -Wextra -Wshadow --std=gnu11 -O0'
let g:ale_cpp_clang_options='-Wall -Wextra -Wshadow --std=gnu++17 -O0'

call plug#end()

" Syntax
syntax enable
syntax on

" ########################################################
" Colors :
" ########
set termguicolors
colorscheme molokai
"let g:palenight_italic = 1

" Transparent background
hi Normal guibg=none
hi NonText guibg=none
hi LineNr guibg=none 

" ALE linter, these settings can't be set before other colors settings
high ALEErrorSign guibg=NONE guifg=red
high ALEWarningSign guibg=NONE guifg=yellow
set signcolumn=yes
hi clear SignColumn

autocmd BufRead,BufNewFile *.conf setf dosini

" ########################################################

" ########################################################
" Indentation :
" #############
set tabstop=4           " Number of spaces per tab
set softtabstop=4       " Number of spaces in tab when editing
set shiftwidth=4        " Number of spaces to use for autoindent
set expandtab           " Tabs are spaces
set copyindent          " Copy indentation of previous line
set autoindent

" ########################################################

" ########################################################
" Search :
" ########
nmap qq :nohl<CR>
set ignorecase          " Ignore case when searching
set smartcase           " Ignore case when only lowercase is typed

" ########################################################

" ########################################################
" Numbers in gutter :
" ###################
set nu rnu              " Display hybrid number

" Auto toggle number mode when entering insert 
augroup numbertoggle
  autocmd!
  autocmd BufEnter,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

" Binding to toggle number mode between relative and not relative
nmap <silent><C-N> :let &rnu = (&rnu ? 0 : 1)<CR>

" ########################################################

" ########################################################
" Keybindings :
" #############

" I keep pressing this by mistake but don't really use it
nmap q <Nop>

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

" ########################################################

" ########################################################
" Others :
" #############

set hidden          " Change to other buffers without saving
set scrolloff=3     " Minimum lines to keep above/below cursor
set wrap            " Wrap long lines
"set cursorline      " Hilight current line

" ########################################################
