nnoremap <SPACE> <Nop>
let mapleader=" "

set nocompatible

set autoindent
set backspace=2
set completeopt=menuone,preview
set cursorline
set encoding=utf-8
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set nobackup
set nowritebackup
set number
set re=0 "for yats
set relativenumber	
set scrolloff=25
set shiftwidth=4
set signcolumn=yes
set tabstop=4
set timeoutlen=400
set undofile
set updatetime=300
set wildmenu
set wildoptions=pum
" set termguicolors

filetype plugin indent on
syntax on

no <C-z> <nop>
no <SPACE> <nop>
no <ESC> :noh<CR>
" no q <nop>

no <C-c> Vyp
vn <C-c> :copy'><CR>gv=gv
no <C-j> :move+<CR>			
vn <C-j> :move'>+<CR>gv=gv
no <C-k> :move-2<CR>
vn <C-k> :move-2<CR>gv=gv 
no <C-s> :w<CR>
vn <C-s> <ESC>:w<CR>
ino <C-s> <ESC>:w<CR>
no U :redo<CR>
no <C-e> :Ex<CR>
no <C-f> :FZF!<CR>
no <C-_> :Rg!<CR>
no <C-b> :Buffers!<CR>
no <leader>tsh :History/!<CR>
no <leader>tsn :Snippets!<CR>
no <leader>tgc :Commits!<CR>
no <leader>gc :G commit -m ''<LEFT>
no <leader>gp :G push<CR>
no <leader>gs :G<CR>
no <leader>rw viw"0p
no <leader>te :tab term<CR>
no <leader>bt :term<CR>bun test<CR>
no <leader>bb :term<CR>bun run build<CR>
no <leader>bl :term<CR>bun run lint<CR>
no <leader>br :term<CR>./release.sh<CR>
no <leader>ff :Format<CR>

" "Aliases" for commonly used commands+lazy shift finger:
command! -bar -nargs=* -complete=file -range=% -bang W         <line1>,<line2>write<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang Wq        <line1>,<line2>wq<bang> <args>
command! -bar                                  -bang Wqa     wqa<bang>

" yank to clipboard, although -selection clipboard is too verbose, keep it
vn <C-y> :w !xclip -selection clipboard<CR> 

" plugins installed via native vim package manager:
packadd! editorconfig
packadd comment

" SirVer/ultisnips.git
" honza/vim-snippets.git
" junegunn/fzf.vim
" machakann/vim-highlightedyank
" mg979/vim-visual-multi
" neoclide/coc.nvim
" tpope/vim-fugitive
" tpope/vim-surround
" vimwiki/vimwiki

" let g:vimwiki_list = [{'path': '~/vimwiki/',
" \ 'syntax': 'markdown', 'ext': 'md'}]

" misc support
" :CocInstall @yaegassy/coc-astro
" :CocInstall @yaegassy/coc-intelephense


" Clear cmd line message
function! s:empty_message(timer)
  if mode() ==# 'n'
    echon ''
  endif
endfunction

augroup cmd_msg_cls
    autocmd!
    autocmd CmdlineLeave :  call timer_start(2000, funcref('s:empty_message'))
augroup END
" /Clear cmd line message

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

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
		
" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Enable/disable floating window for diagnostics
nmap <leader>cde :call coc#config('diagnostic.messageTarget', 'echo')<CR>
nmap <leader>cdf :call coc#config('diagnostic.messageTarget', 'float')<CR>

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" " Remap <C-d> and <C-u> to scroll float windows/popups
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif
	
" GoTo code navigation, pointing directly to deepest source
nmap gD <Plug>(coc-definition)
nmap gY <Plug>(coc-type-definition)
nmap gI <Plug>(coc-implementation)
nmap gR <Plug>(coc-references)

" /COC CONFIG
let g:fzf_layout = { 'window': { 'width': 0.98, 'height': 0.8 } }
let g:coc_diagnostic_enable_float = 0

let g:context_enabled = 0  " load context plugin, but disable it by default

let g:vimwiki_key_mappings = {
            \ 'all_maps': 1,
            \ 'global': 1,
            \ 'headers': 1,
            \ 'text_objs': 1,
            \ 'table_format': 1,
            \ 'table_mappings': 0,
            \ 'lists': 1,
            \ 'links': 1,
            \ 'html': 1,
            \ 'mouse': 0,
            \ }

" Abbreviations

:iabbrev Comunicacao Comunicação
:iabbrev Nao Não
:iabbrev Portugues Português
:iabbrev Situacao Situação
:iabbrev acoes ações
:iabbrev analise análise
:iabbrev botao botão
:iabbrev botoes botões
:iabbrev comencou començou
:iabbrev compativel compatível
:iabbrev comunicacao comunicação
:iabbrev comunicacoes comunicações
:iabbrev conexao conexão
:iabbrev confusao confusão
:iabbrev estatisticas estatísticas
:iabbrev experiencia experiência
:iabbrev experiencia experiência
:iabbrev codigo código
:iabbrev inorganico inorgânico
:iabbrev integracao integração
:iabbrev manutencao manutenção
:iabbrev modificacao modificação
:iabbrev nao não
:iabbrev navegacao navegação
:iabbrev orcamento orçamento
:iabbrev organico orgânico
:iabbrev otimizacao otimização 
:iabbrev portugues português
:iabbrev promocoes promoções
:iabbrev proxima próxima
:iabbrev saida saída
:iabbrev sao são
:iabbrev servicos serviços
:iabbrev situacao situação
:iabbrev subsidiarios subsidiários
:iabbrev tambem também
:iabbrev teh the
:iabbrev usuario usuário
:iabbrev voce você
:iabbrev waht what
" á
" ç
" ã
" ê
" õ
" ot
