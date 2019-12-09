call plug#begin('~/.config/nvim/plugged')
Plug 'raimondi/delimitmate'             " Automatic (), {}, [] closing

Plug 'airblade/vim-gitgutter'

" Color shemes
Plug 'tomasr/molokai'
Plug 'drewtempelmeyer/palenight.vim'

" More motions and text objects
Plug 'bkad/CamelCaseMotion'
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'

" Nice icons
Plug 'ryanoasis/vim-devicons'
set encoding=UTF-8

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf.vim'
set rtp+=~/.fzf

" Languages support
Plug 'justinmk/vim-syntax-extra'
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
silent! colorscheme molokai
" Idk why but MatchParen color is fcked up so I have to set it manually
hi MatchParen guibg=NONE guifg=orange gui=bold
"let g:palenight_italic = 1

" Transparent background
silent! hi Normal guibg=none
silent! hi NonText guibg=none
silent! hi LineNr guibg=none 

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
set tabstop=2           " Number of spaces per tab
set softtabstop=2       " Number of spaces in tab when editing
set shiftwidth=2        " Number of spaces to use for autoindent
set expandtab           " Tabs are spaces
set copyindent          " Copy indentation of previous line
set autoindent

" ########################################################

" ########################################################
" Backup files :
" ########
set noerrorbells
set noswapfile
set nobackup

" ########################################################

" ########################################################
" Search :
" ########
nmap <silent> qq :nohl<CR>
set ignorecase              " Ignore case when searching
set smartcase               " Ignore case when only lowercase is typed

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
"
" ########################################################
" Splits :
" #############
set splitright
set splitbelow
cabbrev s split
cabbrev v vsplit
" ########################################################

" ########################################################
" Keybindings :
" #############

map <space> <leader>

" Map Camel and Snake case motions
silent! call camelcasemotion#CreateMotionMappings('<leader>')

" Repeat last command with one keystroke (azerty keyboard)
nnoremap ; .
nnoremap . ;

" Copy to clipboard
vmap <C-C> "+y

" I keep pressing this by mistake but don't really use it
nmap q <Nop>

" Map escape to jj
imap jj <Esc>

" Remap write
nmap S :w<CR>

" More than 80 chars is bad
" Show a ruller on toggle
nmap qc :let &cc = (&cc == '' ? '79' : '')<CR>

" I don't use J and K but i want to move my cursor faster
nmap J 5j
nmap K 5k

" Remap page moves
" Avoid scrolling one line by one line
nmap <C-J> }
nmap <C-K> {

" Switch buffers with ctrl+h/l
nmap <C-H> :bprev<CR>
nmap <C-L> :bnext<CR>

" ########################################################

" ########################################################
" FZF :
" #############
" Fuzzy find file and open it
nmap <silent> <Leader>f :FZF<CR>
let g:fzf_action={
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" ########################################################

" ########################################################
" Others :
" #############

set lazyredraw      " Avoid useless redraw
set hidden          " Change to other buffers without saving
set wrap            " Wrap long lines
"set cursorline     " Hilight current line

" ########################################################
