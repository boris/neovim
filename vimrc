"Plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'hashivim/vim-terraform'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-syntastic/syntastic'
Plug 'valloric/youcompleteme'
Plug 'github/copilot.vim'
call plug#end()

"Basic stuffs
set nocompatible
filetype plugin indent on
set clipboard=unnamed
syntax enable
syntax on
:filetype on
set incsearch
set ignorecase
set scrolloff=5
set smartcase
set number
set wildmode=longest,list
set fileformats=unix
set smartindent
set smarttab
set history=300
set backspace=2
set hlsearch
set ruler
set formatoptions=1
set linebreak
set autoindent
set mouse=a
set textwidth=80
set dir=/tmp
set modeline
set pastetoggle=<F3>
colorscheme onehalfdark
set background=light
set encoding=UTF-8

"Prepare tab/space indent settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"Cursor lines
set cursorline
highlight CursorLine term=underline guibg=#3b3b3b
set colorcolumn=80
highlight ColorColumn guibg=#3b3b3b

"Set Invisibles
set list
set listchars=tab:→\ ,trail:·,precedes:«,extends:»,eol:¬

"Nerdtree
map <F2> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore = ['\.swp$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_theme='deus'

" Terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1

" Memory
set maxmempattern=500000

" Terminal
set termwinsize=16x0
map <F3> :botright term<CR>
