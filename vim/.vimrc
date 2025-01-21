nnoremap <SPACE> <Nop>
let mapleader=" "
let g:netrw_altfile=1
let g:netrw_liststyle = 1
let g:netrw_sort_sequence = '[\/]\s'

set nocompatible

set autoindent
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
set scrolloff=25
set signcolumn=yes
set tabstop=4
set noexpandtab
set timeoutlen=400
set undofile
set updatetime=300
set wildmenu
set wildoptions=pum
set termguicolors
" set clipboard=unnamedplus " Debian/Rails

filetype plugin indent on
syntax on

no <C-z> <nop>
no <SPACE> <nop>
no <ESC> :noh<CR>

nnoremap <C-c> mcVyp`cj
" mc = mark c, `c = jump to mark c
vn <C-c> :copy'><CR>gv=gv
no <C-j> :move+<CR>			
vn <C-j> :move'>+<CR>gv=gv
no <C-k> :move-2<CR>
vn <C-k> :move-2<CR>gv=gv 

no U :redo<CR>
no <C-e> :Explore<CR>
no <C-f> :FZF!<CR>
no <C-_> :Rg!<CR> 
no <C-b> :Buffers!<CR>
no <C-l> :bn<CR>
no <C-h> :bp<CR>
no <leader>tsh :History/!<CR>
no <leader>tsn :Snippets!<CR>
no <leader>tgc :Commits!<CR>
no <leader>gc :G commit -m ''<LEFT>
no <leader>gg :G log --all --graph --oneline<CR>
no <leader>gp :G push<CR>
no <leader>gs :G<CR>
no <leader>gt :call GitQuickfixCheckout('@-->')<CR>
no <leader>rw viw"0p
no <leader>so :so ~/.vimrc<CR>
no <leader>te :term<CR>
no <leader>bt :term<CR>bun test<CR>
no <leader>bb :term<CR>bun run build<CR>
no <leader>bl :term<CR>bun run lint<CR>
no <leader>br :term<CR>./release.sh<CR>
no <leader>ff :Format<CR>:w<CR>
no <leader>df va{Jdd :echo 'function or declaration deleted'<CR>
no <leader>vf [{V]}
no <leader>yf [{V]}y
no <leader>' <left>yi(Pa:',<esc>%a'<esc>A
imap <c-t> <Esc>cs"{A
no <leader>o :call HandleURL()<cr>
imap <C-t> <esc>cs"'cs'{A
nn * *N

" Aliases for commonly used commands+lazy shift finger:
command! -bar -nargs=* -complete=file -range=% -bang W   <line1>,<line2>write<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang Wq  <line1>,<line2>wq<bang> <args>
command! -bar                                  -bang Wqa wqa<bang>
command! -bar                                  -bang Bd  bd<bang>

" yank to system clipboard
vn <C-y> :w !xclip -selection clipboard<CR> 

" when using quickfix menu with :Gclog, checkout easily to former commits,
" called by custom hotkey calling GitQuickfixCheckout
let g:last_prefixed_line = -1  " Initialize a variable to track the last prefixed line
function! GitQuickfixCheckout(prefix)
    let lnum = line('.')
    let qflist = getqflist()
	if g:last_prefixed_line >= 0 && g:last_prefixed_line < len(qflist)
        let qflist[g:last_prefixed_line].text = substitute(qflist[g:last_prefixed_line].text, '^\s*@-->', '', '')
    endif
    if lnum > 0 && lnum <= len(qflist)
        let qflist[lnum - 1].text = a:prefix . ' ' . qflist[lnum - 1].text
				" update last prefixed line
	    let g:last_prefixed_line = lnum - 1  
        call setqflist(qflist, 'r')
    endif

	" restore cursor position so it appears not to have moved
    execute 'normal! ' . lnum . 'G'

	" use commit hash to checkout (move HEAD) towards
	let commit_hash = substitute(getline(lnum), '\v^([0-9a-f]{6}).*', '\1', '')
    execute 'Git checkout ' . commit_hash 
endfunction

" Follow url to Open in browser
function! HandleURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  echo s:uri
  if s:uri != ""
    silent exec "!qutebrowser '".s:uri."' &"
  else
    echo "No URI found in line."
  endif
endfunction

packadd! editorconfig " editorconfig working properly since Vim 9.1, see `:h editorconfig-install` and `:h editorconfig.txt` after that.
packadd comment " TODO check if still useful

" SirVer/ultisnips.git
" honza/vim-snippets.git
" junegunn/fzf.vim
" machakann/vim-highlightedyank
" mg979/vim-visual-multi
" neoclide/coc.nvim
" tpope/vim-fugitive
" tpope/vim-surround
" vimwiki/vimwiki
" tpope/vim-pathogen " Debian/Rails
" tpope/vim-rails " Debian/Rails
" vim-ruby/vim-ruby " Debian/Rails

" let g:vimwiki_list = [{'path': '~/vimwiki/',
" \ 'syntax': 'markdown', 'ext': 'md'}]

" coc extensions
" * coc-snippets 3.1.10 ~/.config/coc/extensions/node_modules/coc-snippets
" * coc-prettier 9.3.2 ~/.config/coc/extensions/node_modules/coc-prettier
" * coc-html 1.8.0 ~/.config/coc/extensions/node_modules/coc-html
" * coc-eslint 1.7.0 ~/.config/coc/extensions/node_modules/coc-eslint
" + coc-tsserver 2.2.0 ~/.config/coc/extensions/node_modules/coc-tsserver
" + coc-json 1.9.2 ~/.config/coc/extensions/node_modules/coc-json
" + coc-css 2.1.0 ~/.config/coc/extensions/node_modules/coc-css
" + @yaegassy/coc-volar 0.37.0 ~/.config/coc/extensions/node_modules/@yaegassy/coc-volar
" + @yaegassy/coc-intelephense 0.30.4 ~/.config/coc/extensions/node_modules/@yaegassy/coc-inte
" + @yaegassy/coc-astro 0.9.2 ~/.config/coc/extensions/node_modules/@yaegassy/coc-astro


" Clear cmd line message
function! s:empty_message(timer)
  if mode() ==# 'n'
    echon ''
  endif
endfunction

augroup cmd_msg_cls
    autocmd!
    autocmd CmdlineLeave :  call timer_start(18000, funcref('s:empty_message'))
augroup END
" /Clear cmd line message

augroup vimrc
autocmd!
	" autocmd FileType * syntax keyword vimTodo TODO FIXME NOTE OPTIMIZE containedin=.*Comment,vimCommentTitle
	autocmd FileType * syntax keyword Todo TODO containedin=.*Comment,Comment
	autocmd FileType * syntax keyword Todo2 NOTE OPTIMIZE containedin=.*Comment,vimCommentTitle,Comment
	autocmd FileType * syntax keyword Todo3 FIXME containedin=.*Comment,vimCommentTitle,Comment
	autocmd FileType * syntax keyword Todo4 DOING containedin=.*Comment,vimCommentTitle,Comment
	autocmd FileType javascript set syntax=typescript
	autocmd FileType vue set syntax=typescript
augroup END

colorscheme bonbasi
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

" /COC CONFIG

" list of installed CoC plugins (:CocList extensions), to be installed i.e. :CocInstall coc-snippets
"  * coc-snippets 3.1.10 ~/.config/coc/extensions/node_modules/coc-snippets
"  * coc-prettier 9.3.2 ~/.config/coc/extensions/node_modules/coc-prettier
"  * coc-html 1.8.0 ~/.config/coc/extensions/node_modules/coc-html
"  * coc-eslint 1.7.0 ~/.config/coc/extensions/node_modules/coc-eslint
"  + coc-tsserver 2.2.0 ~/.config/coc/extensions/node_modules/coc-tsserver
"  + coc-json 1.9.2 ~/.config/coc/extensions/node_modules/coc-json
"  + coc-css 2.1.0 ~/.config/coc/extensions/node_modules/coc-css
"  + @yaegassy/coc-intelephense 0.30.4 ~/.config/coc/extensions/node_modules/@yaegassy/coc-intelephense
"  coc-solargraph 1.2.4 ~/.config/coc/extensions/node_modules/coc-solargraph " Debian/Rails

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

" Highlight the symbol and its references when holding the cursor, nice feature, but dont want it right now
" autocmd CursorHold * silent call CocActionAsync('highlight')

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
nmap <leader>cac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>cas  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>cqf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>cre <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>cr  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>cr  <Plug>(coc-codeaction-refactor-selected)

" Enable/disable floating window for diagnostics
nmap <leader>cde :call coc#config('diagnostic.messageTarget', 'echo')<CR>
nmap <leader>cdf :call coc#config('diagnostic.messageTarget', 'float')<CR>
nmap <leader>cdx :call coc#config('diagnostic.virtualTextCurrentLineOnly',1)<CR> :call coc#config('diagnostic.virtualText',0)<CR>
nmap <silent> <leader>cdv1 :call coc#config('diagnostic.virtualText',1)<CR> :CocRestart<CR>
nmap <silent> <leader>cdv0 :call coc#config('diagnostic.virtualText',0)<CR> :CocRestart<CR>

" Run the Code Lens action on the current line
" nmap <leader>ccl  <Plug>(coc-codelens-action) " commented because i dont use codelens (yet)

" Remap <C-d> and <C-u> to scroll float windows/popups
nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	
" GoTo code navigation, pointing directly to deepest source
nmap gD <Plug>(coc-definition)
nmap <silent> <leader>gdv :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> <leader>gds :call CocAction('jumpDefinition', 'split')<CR>
nmap gY <Plug>(coc-type-definition)
nmap gI <Plug>(coc-implementation)
nmap gR <Plug>(coc-references)

" /COC CONFIG
let g:fzf_layout = { 'window': { 'width': 1, 'height': 1 } }
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
let g:Port = 0
function! TogglingPort()
if g:Port == 1
    let g:Port = 0
    echo "Portuguese abbreviations are not active."
else
    let g:Port = 1
    echo "Portuguese abbreviations are active."
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
	:iabbrev sequencia sequência
	:iabbrev acessivel acessível
	:iabbrev reference referência
	:iabbrev crianca criança
	:iabbrev criancas crianças
	:iabbrev variavel variável
	:iabbrev memoria memória
	:iabbrev definicao definição
	:iabbrev aplicacoes aplicações
	:iabbrev computacao computaçao
	:iabbrev padrao padrão
endif
endfunction
nnoremap <leader>tp :call TogglingPort()<CR>

set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-1.\(%)\ %Y\ -\ %(%l,%v[%p%%]\ %)
" execute pathogen#infect() " Debian/Rails
