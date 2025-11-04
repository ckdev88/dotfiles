vim9script

nnoremap <SPACE> <Nop>
g:mapleader = " "
g:netrw_altfile = 1
g:netrw_liststyle = 1
g:netrw_sort_sequence = '[\/]\s'

set nocompatible

set autoindent
set completeopt=menuone,preview
set cursorline
set encoding=utf-8
set hlsearch
set ignorecase
set foldmethod=manual
set foldlevel=0
set incsearch
set laststatus=2
set nobackup
set nowritebackup
set number
set re=0 # for yats
set scrolloff=25
set signcolumn=yes
set tabstop=4
set shiftwidth=4
set expandtab
set timeoutlen=400
set undofile
set updatetime=300
set wildmenu
set wildoptions=pum
set termguicolors

filetype plugin indent on
syntax on

no <C-z> <nop>
no <SPACE> <nop>
no <ESC> :noh<CR>

nn <C-c> mcVyp`cj
# mc = mark c, `c = jump to mark c
vn <C-c> :copy'><CR>gv=gv
no <C-j> :move+<CR>			
vn <C-j> :move'>+<CR>gv=gv
no <C-k> :move-2<CR>
vn <C-k> :move-2<CR>gv=gv 

# nno j gj
# nno k gk

no U :redo<CR>
no <C-e> :Explore<CR>
no <C-l> :bn<CR>
no <C-h> :bp<CR>

# Popup: search stuffs
# no <C-_> :Rg!<CR> 
# no <C-b> :Buffers!<CR>
# no <leader>psh :History/!<CR>
# no <leader>psn :Snippets!<CR>
# no <leader>pgc :Commits!<CR>
no <C-f> :FZF!<CR>
no <C-_> :Rg<CR>

# vim shortcuts
nn <leader>vg :copen<CR>:vimgrep // ./src/**/* <LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
nn <leader>n :cnext<CR>
nn <leader>p :cprev<CR>

nn <C-b> :Buffers!<CR>
nn <leader>sh :History/!<CR>
nn <leader>ss :Snippets!<CR>

# FUGITIVES
nn <leader>sc :Commits!<CR>
no <leader>gb :G branch<CR>
no <leader>gc :G commit -m ''<LEFT>
no <leader>gg :G log --all --graph --oneline<CR>
no <leader>gp :G push<CR>
no <leader>gs :w<CR>:!bun run format<CR>:G<CR>
no <leader>gt <ScriptCmd> GitQuickfixCheckout('@-->')<CR>
no <leader>gv <ScriptCmd> GV!<CR> # requires vim-gv

# diff
no <leader>dg V:diffget<CR>
vno <leader>dg :diffget<CR>
no <leader>dp :'<,'>diffput<CR>
vno <leader>dp :diffput<CR>

# MISC MACROS
# replace current word with latest from register
no <leader>rw viw"0p
# delete current function
no <leader>df va{Jdd :echo 'function or declaration deleted'<CR>
# select current function
no <leader>vf [{V]} " select function
# yank current function
no <leader>yf [{V]}y
# select ranges -- Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
# PHP: dump/log current data
nn <leader>lp <ScriptCmd> L<CR>
# Save and refresh theme bonbasi
no <leader>rf :w<CR>:colo bonbasi<CR>
# Turn selection text into t̶e̶x̶t̶ (utf)
vno <leader>strike :s/\%V\(.\)/\=submatch(1) . "\u0336"/g<CR>

# misc quickmaps
no <leader>so :so ~/.vimrc<CR>

# terminal builds
no <leader>te :term<CR>
no <leader>bt :term<CR>bun test<CR>
no <leader>bb :term<CR>bun run build<CR>
no <leader>bl :term<CR>bun run lint<CR>
no <leader>bb :w<CR>:term<CR>bun run build<CR>

no <leader>bl :call BunLintRunner()<CR>
no <leader>bL :call BunTscLintRunner()<CR>

no [q :cprev<CR>
no ]q :cnext<CR>

# no <leader>br :term<CR>./release.sh<CR>
no <leader>brb :term<CR>./release_beta.sh<CR>
no <leader>brp :term<CR>./release.sh<CR>
no <leader>ff :Format<CR>
# no <leader>ff :Format<CR>:w<CR>
# no <leader>fm :w<CR><ScriptCmd> FormatBiome()<CR>:e<CR><CR>jk
no <leader>fm :w<CR>:!biome format % --write<CR>:e<CR><CR>jk

# Markdown
no <leader>mb I**<esc>A**<esc>
# Markdown: Highlight strike-through text in markdown (vim-polyglot/syntax/markdown.vim)
g:vim_markdown_strikethrough = 1

# misc
no <leader>' <left>yi(Pa:',<esc>%a'<esc>A
imap <C-t> <esc>cs"'cs'{A
no <leader>rc :Rails console<CR>

# Whats this?
nn * *N

# Nog nodig na gx?
# zie bug in polyglot: ./ftplugin/markdown.vim : 729
no <silent> <leader>o <ScriptCmd> HandleURL()<cr> 

# Aliases for commonly used commands+lazy shift finger:
command! -bar -bang W w<bang>
command! -bar -bang WQ wq<bang>
command! -bar -bang Wq wq<bang>
command! -bar -bang WQA wqa<bang>
command! -bar -bang WQa wqa<bang>
command! -bar -bang Wqa wqa<bang>
command! -bar -bang Bd bd<bang>
command! -bar -bang Q q<bang>

# yank to system clipboard, although -selection clipboard is too verbose, keep it
vn <C-y> :w !xclip -selection clipboard<CR> 

# def Grepme()
	# execute 
# enddef

def LogPhp()
    execute '!php % | less'
enddef

def BunTest()
    execute '!bun test'
enddef

def NpmTest()
    exec '!npm run test'
enddef

def BunLintRunner()
	exec ':cgetexpr system("bun run lint")'
	exec ':copen'
enddef

def BunTscLintRunner()
  var old_errorformat = &errorformat # Save current errorformat
  set errorformat=%f(%l\\,%c):\ %m # Set simple errorformat that matches standard tsc output
  var output = system('bunx tsc --noEmit') # Get output ... 
  var cleaned_output = substitute(output, '^|| ', '', 'g') # ... and remove || prefixes
  cexpr cleaned_output # Load into quickfix
  &errorformat = old_errorformat # Restore errorformat
  if !empty(getqflist()) # Open quickfix if there are errors
    copen
  else
    echo 'No TypeScript errors found'
  endif
enddef



# when using quickfix menu with :Gclog, checkout easily to former commits,
# called by custom hotkey calling GitQuickfixCheckout
g:last_prefixed_line = -1  # Initialize a variable to track the last prefixed line

def GitQuickfixCheckout(prefix: string)
    var lnum = line('.')
    var qflist = getqflist()
    if g:last_prefixed_line >= 0 && g:last_prefixed_line < len(qflist)
        qflist[g:last_prefixed_line].text = substitute(qflist[g:last_prefixed_line].text, '^\s*@-->', '', '')
    endif
    if lnum > 0 && lnum <= len(qflist)
        qflist[lnum - 1].text = prefix .. ' ' .. qflist[lnum - 1].text
        # update last prefixed line
        g:last_prefixed_line = lnum - 1
        setqflist(qflist, 'r')
    endif

    # restore cursor position so it appears not to have moved
    execute 'normal! ' .. lnum .. 'G'

    # use commit hash to checkout (move HEAD) towards
    var commit_hash = substitute(getline(lnum), '\v^([0-9a-f]{6}).*', '\1', '')
    execute 'Git checkout ' .. commit_hash
enddef

# Follow url to Open in browser -- FIXME niet gewoon verwijderen vanwege
# mapping gx?
def HandleURL()
  var uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  echo uri
  if uri != ''
	execute 'silent! !xdg-open "'..s:uri..'" &'
  else
    echo "No URI found in line."
  endif
enddef

def FormatBiome()
	exec "silent! !biome format % --write"
enddef

# PACKADD NATIVE FUNCTIONS: replacing plugins
packadd! editorconfig # editorconfig working properly since Vim 9.1, see `:h editorconfig-install` and `:h editorconfig.txt` after that.
packadd comment # https://vimhelp.org/usr_05.txt.html#comment-install
packadd hlyank # https://vimhelp.org/usr_05.txt.html#hlyank-install
g:hlyank_duration = 100

# SirVer/ultisnips.git
# honza/vim-snippets.git
# junegunn/fzf.vim
# mg979/vim-visual-multi
# neoclide/coc.nvim
# tpope/vim-fugitive
# tpope/vim-surround
# tpope/vim-repeat
# tpope/vim-dadbod
# kristijanhusak/vim-dadbod-completion
# kristijanhusak/vim-dadbod-ui
# junegunn/gv.vim

augroup vimrc
	  autocmd!
	  autocmd FileType javascript set syntax=typescript
	  # autocmd FileType vue set syntax=typescript
augroup END

def ShowSyntax()
  var id = synID(line('.'), col('.'), 1)
  var name = synIDattr(id, 'name')
  var linked = synIDattr(synIDtrans(id), 'name')
  echo name .. (name != linked ? ' -> ' .. linked : '')
enddef
nnoremap <leader>ws <ScriptCmd> ShowSyntax()<CR>
nnoremap <leader>wS :echo synstack(line('.'), col('.'))->map({_, v -> synIDattr(v, "name")})<CR>

# COC CONFIG
def ShowDocumentation()
  if coc#rpc#request('hasProvider', ['hover'])
    coc#rpc#request('doHover', [])
  else
    feedkeys('K', 'in')
  endif
enddef
nnoremap <silent> K <ScriptCmd>call ShowDocumentation()<CR>

# /COC CONFIG

# list of installed CoC plugins (:CocList extensions), to be installed i.e. :CocInstall coc-snippets
# coc-snippets 3.4.7 ~/.config/coc/extensions/node_modules/coc-snippets
# coc-pyright 1.1.400 ~/.config/coc/extensions/node_modules/coc-pyright
# coc-html 1.8.0 ~/.config/coc/extensions/node_modules/coc-html
# coc-db 0.0.44 ~/.config/coc/extensions/node_modules/coc-db
# @yaegassy/coc-tailwindcss3 0.6.6 ~/.config/coc/extensions/node_modules/@yaegassy/coc-tailwindcss3
# coc-tsserver 2.3.1 ~/.config/coc/extensions/node_modules/coc-tsserver
# coc-omnisharp 0.0.28 ~/.config/coc/extensions/node_modules/coc-omnisharp
# coc-json 1.9.3 ~/.config/coc/extensions/node_modules/coc-json
# coc-java 1.26.1 ~/.config/coc/extensions/node_modules/coc-java
# coc-htmldjango 0.14.22 ~/.config/coc/extensions/node_modules/coc-htmldjango
# coc-css 2.1.0 ~/.config/coc/extensions/node_modules/coc-css
# coc-blade 0.18.11 ~/.config/coc/extensions/node_modules/coc-blade
# coc-biome 1.8.0 ~/.config/coc/extensions/node_modules/coc-biome
# @yaegassy/coc-volar 0.37.4 ~/.config/coc/extensions/node_modules/@yaegassy/coc-volar
# @yaegassy/coc-laravel 0.7.18 ~/.config/coc/extensions/node_modules/@yaegassy/coc-laravel
# @yaegassy/coc-intelephense 0.31.3 ~/.config/coc/extensions/node_modules/@yaegassy/coc-intelephense
# @yaegassy/coc-astro 0.9.2 ~/.config/coc/extensions/node_modules/@yaegassy/coc-astro


# au FileType python setlocal formatprg=autopep8\ -
# `pipx install autopep8` will install autopep8 into ~/.local/bin which is
# needed to format .py files

# NOTE: for coc-biome: possibly need to add to ~/.npmrc (if file not exists, create it): `coc.nvim:registry=https://registry.npmmirror.com`
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

# Make <CR> to accept selected completion item or notify coc.nvim to format
# <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
			\ : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

def CheckBackspace(): bool
	var col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
enddef

# Highlight the symbol and its references when holding the cursor, nice feature, but dont want it right now
# autocmd CursorHold * silent call CocActionAsync('highlight')

# Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

# Add `:Format` command to format current buffer
command! -nargs=0 Format <ScriptCmd> CocActionAsync('format')

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
		
# Applying code actions to the selected code block
# Example: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

# Remap keys for applying code actions at the cursor position
nmap <leader>cac  <Plug>(coc-codeaction-cursor)
# Remap keys for apply code actions affect whole buffer
nmap <leader>cas  <Plug>(coc-codeaction-source)
# Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>cqf  <Plug>(coc-fix-current)

# Remap keys for applying refactor code actions
nmap <silent> <leader>cre <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>cr  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>cr  <Plug>(coc-codeaction-refactor-selected)

# Enable/disable floating window for diagnostics
nmap <leader>cde <ScriptCmd> coc#config('diagnostic.messageTarget', 'echo')<CR>
nmap <leader>cdf <ScriptCmd> coc#config('diagnostic.messageTarget', 'float')<CR>
nmap <leader>cdx <ScriptCmd> coc#config('diagnostic.virtualTextCurrentLineOnly',1)<CR> <ScriptCmd> coc#config('diagnostic.virtualText',0)<CR>
nmap <silent> <leader>cdv1 <ScriptCmd> coc#config('diagnostic.virtualText',1)<CR> :CocRestart<CR>
nmap <silent> <leader>cdv0 <ScriptCmd> coc#config('diagnostic.virtualText',0)<CR> :CocRestart<CR>

# Remap <C-d> and <C-u> to scroll float windows/popups
nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	
# CoC: GoTo code navigation, pointing directly to deepest source
nmap gD <Plug>(coc-definition)
nmap <silent> gs <ScriptCmd> CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> <leader>gds <ScriptCmd> CocAction('jumpDefinition', 'split')<CR>
nmap gY <Plug>(coc-type-definition)
nmap gI <Plug>(coc-implementation)
nmap gR <Plug>(coc-references)

# CoC: Jump-to-definition for gf in TypeScript/JS files
autocmd FileType typescript,typescriptreact,javascript,javascriptreact nnoremap <buffer> <silent> gf <ScriptCmd> CocAction('jumpDefinition')<CR>

# Dumb file jumper with tsconfig alias resolution
nnoremap <silent> gF <ScriptCmd> DumbFileJump()<CR>

def DumbFileJump()
    var import_path = matchstr(getline('.'), '[''"]\zs[^''"]*\ze[''"]')
    if empty(import_path)
        echo "No import path found"
        return
    endif
    # echo "Import path: " .. import_path
    var tsconfig_file = findfile('tsconfig.json', '.;')
    if empty(tsconfig_file)
        echo "tsconfig.json not found"
        return
    endif
    # echo "tsconfig: " .. tsconfig_file

    try
        var config = json_decode(join(readfile(tsconfig_file), "\n"))
        var paths = get(get(config, 'compilerOptions', {}), 'paths', {})

        # echo "Available paths: "
        for [alias, targets] in items(paths)
            # echo "  " .. alias .. " -> " .. string(targets)

            # Check if this alias matches
            var alias_base = substitute(alias, '\*$', '', '')
            if import_path =~# '^' .. alias_base
                # echo "MATCH found: " .. alias
                var target = targets[0]
                var target_base = substitute(target, '\*$', '', '')
                var rest = substitute(import_path, '^' .. alias_base, '', '')
                var resolved = target_base .. rest
                # echo "Resolved to: " .. resolved

                if filereadable(resolved) || isdirectory(resolved)
                    execute 'edit ' .. resolved
                else
                    echo "File not found: " .. resolved
                endif
                return
            endif
        endfor
        echo "No matching alias found for: " .. import_path
    catch /.*/
        echo "Error parsing tsconfig.json: " .. v:exception
    endtry
enddef

g:fzf_layout = { 'window': { 'width': 1, 'height': 1 } }
g:coc_diagnostic_enable_float = 0

g:context_enabled = 0  # load context plugin, but disable it by default

# START (weet niet zo goed wat ik hiermee moet)
g:db_ui_auto_execute_table_helpers = 1

# kristijanhusak/vim-dadbod-completion
# For built in omnifunc
# autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni

# hrsh7th/nvim-compe
# let g:compe.source.vim_dadbod_completion = v:true

# hrsh7th/nvim-cmp
  # autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })

# Shougo/ddc.vim
# call ddc#custom#patch_filetype(['sql', 'mysql', 'plsql'], 'sources', 'dadbod-completion')
# call ddc#custom#patch_filetype(['sql', 'mysql', 'plsql'], 'sourceOptions', {
# \ 'dadbod-completion': {
# \   'mark': 'DB',
# \   'isVolatile': v:true,
# \ },
# \ })
# EINDE (weet niet zo goed wat ik hiermee moet)

# nnoremap <leader>Rg :Rg! --hidden<Space>
nnoremap <leader>Rg :Rg --no-filename<CR>

nnoremap <leader>rg <ScriptCmd> fzf#vim#grep(
  \ 'rg --column --line-number --no-heading --color=always --smart-case '.fzf#shellescape(expand('<cword>')),
  \ 1,
  \ fzf#vim#with_preview({'options': '--delimiter : --with-nth 3..'}),
  \ 0
\)<CR>

set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-1.\(%)\ %Y\ -\ %(%l,%v[%p%%]\ %)


# Abbreviations
g:Port = 0
def TogglingPort()
    if g:Port == 1
        g:Port = 0
        echo "Portuguese abbreviations are not active."
    else
        g:Port = 1
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
enddef
nnoremap <leader>tp <ScriptCmd> TogglingPort()<CR>

colorscheme bonbasi

def ShowDocumentation()
  if coc#rpc#request('hasProvider', ['hover'])
    coc#rpc#request('doHover', [])
  else
    feedkeys('K', 'in')
  endif
enddef
# TROUBLESHOOTING
# :profile start profile.log
# :profile func *
# :profile file *
# NOTES: Polyglot 2025-10-24
# vim-polyglot verwijderd op 2025-10-24, onnodig zwaar, en weet niet meer
# waarom het nuttig is, aangezien 1) vim-basics erg goed zijn en 2)
# vim-polyglot vrijwel nooit geupdate wordt

nnoremap <silent> K <ScriptCmd>call ShowDocumentation()<CR>
