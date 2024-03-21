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
set smartcase
set hlsearch
set undofile
set completeopt=menuone,noselect,preview
set wildmenu
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

" function! s:open_netrw()
"   " Grab the current file name
"   let file_name = expand("%:t")
"   Explore 
"   let t:netrw_buffer_number = bufnr("%")
"   call search(file_name)
" endfunction
" 
" " netrw file navigation
" function! s:open_netrw()
"   let file_name = expand("%:t")
"   " Open 200-column left-side explorer in the directory for the current file
"   200Lexplore %:h
"   let t:netrw_buffer_number = bufnr("%")
"   " find the file in the explorer
"   call search(file_name)
" endfunction
" 
" function! s:toggle_netrw()
"   if exists("t:netrw_buffer_number")
"     let netrw_window_number = bufwinnr(t:netrw_buffer_number)
"     if netrw_window_number != -1
"       let current_working_buffer = winnr()
"       exec netrw_window_number . 'wincmd w'
"       close
"       if current_working_buffer != netrw_window_number
"         exec 'silent! ' . current_working_buffer . 'wincmd w'
"       endif
"       unlet t:netrw_buffer_number
"     else
"       call s:open_netrw()
"     endif
"   else
"     call s:open_netrw()
"   endif
" endfunction
" command! ToggleNetrwExplorer call s:toggle_netrw()
" nnoremap <silent> \\ :ToggleNetrwExplorer<CR>
" no <C-e> :ToggleNetrwExplorer<CR>

" plugins
" geinstalleerd via vim's built-in package manager:
	" tpope/vim-surround
	" tpope/vim-commentary
	" vimwiki/vimwiki
	" neoclide/coc.nvim

" let g:vimwiki_list = [{'path': '~/vimwiki/',
" \ 'syntax': 'markdown', 'ext': 'md'}]


colorscheme retrobox
hi Normal ctermbg=black
hi Normal ctermbg=black " double, because otherwise VIM will ignore it for some reason, only seems to do this when it comes to retrobox though...

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

