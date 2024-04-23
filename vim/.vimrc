nnoremap <SPACE> <Nop>
let mapleader=" "

set nocompatible

set backspace=2
set completeopt=menuone,noselect,preview
set cursorline
set encoding=utf-8
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set nobackup
set nowritebackup
set number
set relativenumber	
set scrolloff=15
set shiftwidth=4
set signcolumn=yes
set tabstop=4
set timeoutlen=400
set undofile
set updatetime=300
set wildmenu
set wildoptions=pum

filetype plugin indent on
syntax on

no <C-z> <nop>
no <SPACE> <nop>
no <ESC> :noh<CR>
no q <nop>

no <C-c> Vyp
no <C-j> :move+<CR>			" move line down
vn <C-j> :move'>+<CR>gv=gv 	" move selection down 
no <C-k> :move-2<CR>
no <leader>s <esc>:w<CR>
no U :redo<CR>
no <C-e> :Ex<CR>
no <C-f> :FZF<CR>
no <C-_> :Rg<CR>
no <C-b> :Buffers<CR>
no <leader>tsh :History/<CR>
no <leader>tsn :Snippets<CR>
no <leader>tgc :Commits<CR>

" yank to clipboard, although -selection clipboard is too verbose, keep it
vn <C-y> :w !xclip -selection clipboard<CR> 

" junegunn/fzf.vim
" plugins installed via native vim package manager:
	" SirVer/ultisnips.git
	" honza/vim-snippets.git
	" machakann/vim-highlightedyank
	" neoclide/coc.nvim
	" tpope/vim-commentary
	" tpope/vim-fugitive
	" tpope/vim-surround
	" vimwiki/vimwiki

" let g:vimwiki_list = [{'path': '~/vimwiki/',
" \ 'syntax': 'markdown', 'ext': 'md'}]

colorscheme bonbasique

let g:highlightedyank_highlight_duration = 100

function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction
nnoremap <leader>ws :call SynGroup()<CR>

" COC CONFIG

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
nnoremap <silent> K :call ShowDocumentation()<CR>

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Formatting selected code
xmap <leader>ff  <Plug>(coc-format-selected)
nmap <leader>ff  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" /COC CONFIG


let g:fzf_layout = { 'window': { 'width': 0.98, 'height': 0.8, 'relative': v:true } }
