colorscheme slate 
let mapleader=' '

set nocompatible
set number
set cursorline
set tabstop=4
set shiftwidth=4
set timeoutlen=400
set laststatus=2
set ignorecase
set smartcase
set hlsearch
set undofile
set completeopt=menuone,noselect,preview
set wildmenu
set backspace=2
set incsearch
set scrolloff=15

filetype plugin indent on
syntax on

no <C-z> <nop>
no <SPACE> <nop>
no <ESC> :noh<CR>

no <C-d> Vpp
no <C-j> :move+<CR>			" move line down
vn <C-j> :move'>+<CR>gv=gv 	" move selection down 
no <C-k> :move-2<CR>
no <C-s> <esc>:w<CR>

vn <C-a> <Esc>2<C-o>

" plugins
" geinstalleerd via vim's built-in package manager:
	" tpope/vim-surround
	" tpope/vim-commentary
	" vimwiki/vimwiki

" let g:vimwiki_list = [{'path': '~/vimwiki/',
" \ 'syntax': 'markdown', 'ext': 'md'}]

hi Normal ctermbg=black
