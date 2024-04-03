nnoremap <SPACE> <Nop>
let mapleader=" "

set nocompatible

set number
set cursorline
set tabstop=4
set shiftwidth=4
set timeoutlen=400
set laststatus=2
set ignorecase
set hlsearch
set undofile
set completeopt=menuone,noselect,preview
set wildmenu
set wildoptions=pum

set backspace=2
set incsearch
set scrolloff=15
set relativenumber	

set encoding=utf-8
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes

filetype plugin indent on
syntax on

no <C-z> <nop>
no <SPACE> <nop>
no <ESC> :noh<CR>

no <C-c> Vpp
no <C-j> :move+<CR>			" move line down
vn <C-j> :move'>+<CR>gv=gv 	" move selection down 
no <C-k> :move-2<CR>
no <leader>s <esc>:w<CR>
no U :redo<CR>
no <C-e> :Ex<CR>
no <C-f> :FZF<CR>

" yank to clipboard, although -selection clipboard is too verbose, keep it
vn <C-y> :w !xclip -selection clipboard<CR> 

" plugins
" geinstalleerd via vim's built-in package manager:
	" tpope/vim-surround
	" tpope/vim-commentary
	" vimwiki/vimwiki
	" neoclide/coc.nvim
	" SirVer/ultisnips.git
	" honza/vim-snippets.git

" let g:vimwiki_list = [{'path': '~/vimwiki/',
" \ 'syntax': 'markdown', 'ext': 'md'}]

colorscheme bonbasique
" CoC config
source "~/.vim/cocconfig.vim"

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
nnoremap <silent> K :call ShowDocumentation()<CR>
