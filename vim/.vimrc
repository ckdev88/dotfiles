vim9script

nnoremap <SPACE> <Nop>
g:mapleader = " "
g:netrw_altfile = 1
g:netrw_liststyle = 1
g:netrw_sort_sequence = '[\/]\s'

set nocompatible
set completeopt=menuone,preview
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
set relativenumber
set re=0 # for yats
set scrolloff=25
set signcolumn=yes
# onderstaande 4 in comment, experiment met biome
# set autoindent off
# set tabstop=4
# set shiftwidth=4
# set expandtab

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

set timeoutlen=800
set undofile
set updatetime=10000
set wildmenu
set wildoptions=pum
set termguicolors
set cursorline

set splitright

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
# no <leader>gs :w<CR>:!bun run format<CR>:G<CR>
no <leader>gs :w<CR>:G<CR>
no <leader>gt <ScriptCmd> GitQuickfixCheckout('@-->')<CR>
no <leader>gv <ScriptCmd> GV!<CR> # requires vim-gv

# diff
no <leader>dg V:diffget<CR>
vno <leader>dg :diffget<CR>
no <leader>dp :'<,'>diffput<CR>
vno <leader>dp :diffput<CR>
nnoremap <leader>lipsum :Lipsum<CR>

# Vue: style or related
# jump to referenced sfc
no <leader>vd gdngf

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
no <leader>` :term<CR>
no <leader>bt :term<CR>bun test<CR>
no <leader>bb :term<CR>bun run build<CR>
# no <leader>bl :term<CR>bun run lint<CR>
no <leader>bb :w<CR>:term<CR>bun run build<CR>

no [q :cprev<CR>
no ]q :cnext<CR>

# no <leader>br :term<CR>./release.sh<CR>
no <leader>brb :term<CR>./release_beta.sh<CR>
no <leader>brp :term<CR>./release.sh<CR>
no <leader>ff :Format<CR>
vmap <leader>fa <Plug>(coc-format-selected)

no <silent> <leader>fm :w<CR>:!biome format % --write<CR>:e<CR><CR>ggG<c-o><c-o>

# command! -nargs=0 Format call s:DebugFormat()
# 
# function! s:DebugFormat()
#   echo "Starting format request..."
#   echo "Filetype: " . &filetype
#   echo "Coc formatters: " . string(coc#list#formatters())
# 
#   " Call the original format
#   call coc#rpc#request('format', [])
# endfunction

# Markdown: shortcuts
# Make Bold
no <leader>mb I**<esc>A**<esc>

# Macro: macro's


# misc
no <leader>' <left>yi(Pa:',<esc>%a'<esc>A
imap <C-t> <esc>cs"'cs'{A
no <leader>rc :Rails console<CR>

# Whats this?
nn * *N

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
  cgetexpr system('bun run lint')
  copen
enddef
nnoremap <leader>bl <ScriptCmd> BunLintRunner()<CR>

def BunCheckRunner()
  cgetexpr system('bun run check')
  copen
enddef
nnoremap <leader>bc <ScriptCmd> BunCheckRunner()<CR>
nnoremap <leader>bC :silent !bun run check-write<CR>

def BunTscLintRunner()
    var old_errorformat = &errorformat 
    set errorformat=%f(%l\\,%c):\ %m    
    var output = system('bunx tsc --noEmit')  
    var cleaned_output = substitute(output, '^|| ', '', 'g')
    cexpr cleaned_output  
    &errorformat = old_errorformat 
    if !empty(getqflist()) 
        copen
    else
        echo 'No TypeScript errors found'
    endif
enddef
nnoremap <leader>bL <ScriptCmd> BunTscLintRunner()<CR>

## TROUBLESHOOTING: vue setup
# def CheckVueSetup()
#   echo 'Filetype: ' . &filetype
#   echo 'Syntax: ' . &syntax
#   echo 'coc.volar active: ' . (get(g:, 'coc_service_initialized', 0) ? 'Yes' : 'No')
#   # Check if we have Vue syntax plugin
#   if !empty(findfile('syntax/vue.vim', &rtp))
#     echo 'Vue syntax plugin: Found'
#   else
#     echo 'Vue syntax plugin: NOT found - install vim-vue'
#   endif
# enddef

# Copies only the text that matches search hits
# see https://vim.fandom.com/wiki/Copy_search_matches
def CopyMatches(reg: string)
  var hits: list<string> = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  var target_reg = empty(reg) ? '+' : reg
  execute 'let @' .. target_reg .. ' = join(hits, "\n") . "\n"'
enddef
command! -register CopyMatches Call CopyMatches(<q-reg>)

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

# COC: open mdn link in popup window van :doHover FIXME werkt niet met
# vim9script man, CocAction not available...
def OpenMDNReference()
    # Use CocAction to get hover and try to extract URL
    try
        var hover = CocAction('getHover')
        var content = string(hover)
        var urls = matchlist(content, 'MDN Reference: \(\https://[^''"]*\)')
        if !empty(urls) && len(urls) > 1
            var url = urls[1]
            if has('mac')
                silent! call job_start(['open', url])
            elseif has('unix')
                silent! call job_start(['xdg-open', url])
            elseif has('win32')
                silent! call job_start(['cmd', '/c', 'start', '', url])
            endif
            echom "Opening: " .. url
        else
            echom "No MDN URL found in hover"
        endif
    catch
        echom "Error getting hover information"
    endtry
enddef
nnoremap <silent> <leader>mdn <ScriptCmd> OpenMDNReference()<CR>
# /COC: open mdn link in popup window van :doHover

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
# coc-prettier 11.0.1 ~/.config/coc/extensions/node_modules/coc-prettier
# coc-html 1.8.0 ~/.config/coc/extensions/node_modules/coc-html
# coc-eslint 3.0.15 ~/.config/coc/extensions/node_modules/coc-eslint
# coc-db 0.0.44 ~/.config/coc/extensions/node_modules/coc-db
# @yaegassy/coc-tailwindcss3 0.6.14 ~/.config/coc/extensions/node_modules/@yaegassy/coc-tailwindcss3
# coc-tsserver 2.3.1 ~/.config/coc/extensions/node_modules/coc-tsserver
# coc-sql 0.14.0 ~/.config/coc/extensions/node_modules/coc-sql
# coc-pyright 1.1.405 ~/.config/coc/extensions/node_modules/coc-pyright
# coc-json 1.9.3 ~/.config/coc/extensions/node_modules/coc-json
# coc-java 1.26.1 ~/.config/coc/extensions/node_modules/coc-java
# coc-htmldjango 0.14.23 ~/.config/coc/extensions/node_modules/coc-htmldjango
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
command! -nargs=0 Format call coc#rpc#request('format', [])

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
nmap <silent> gs <Cmd>call coc#rpc#request('jumpDefinition', ['vsplit'])<CR>
# nmap <silent> gs <ScriptCmd> CocAction('jumpDefinition', 'vsplit')<CR>
# nmap <silent> <leader>gds <ScriptCmd> CocAction('jumpDefinition', 'split')<CR>
nmap gY <Plug>(coc-type-definition)
nmap gI <Plug>(coc-implementation)
nmap gR <Plug>(coc-references)

# CoC: Jump-to-definition for gf in TypeScript/JS files

# Commented 2025-11-04 - Vue works better this way, dno about React yet
#autocmd FileType typescript,typescriptreact,javascript,javascriptreact,vue nnoremap <buffer> <silent> gf <ScriptCmd> CocAction('jumpDefinition')<CR>

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

# RipGrep: search current word in files
nnoremap <leader>rg <ScriptCmd>
  \ fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '
  \ .. fzf#shellescape(expand('<cword>')), 1,
  \ fzf#vim#with_preview({'options': '--delimiter : --with-nth 3..'}), 0)<CR>

inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--ansi --delimiter : --nth 3..',
  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-1.\(%)\ %Y\ -\ %(%l,%v[%p%%]\ %)

 # Abbreviations: General -- see :digraphs / :dig!
iabbrev digstar1 ☆
iabbrev digstar2 ★
iabbrev digok ✓
iabbrev digx ✗

# Abbreviations: Português
g:Port = 0
def TogglingPort()
    if g:Port == 1
        g:Port = 0
        echo "Portuguese abbreviations are not active."
    else
        g:Port = 1
        echo "Portuguese abbreviations are active."
        iabbrev Comunicacao Comunicação
        iabbrev Nao Não
        iabbrev Portugues Português
        iabbrev Situacao Situação
        iabbrev acoes ações
        iabbrev analise análise
        iabbrev botao botão
        iabbrev botoes botões
        iabbrev comencou començou
        iabbrev compativel compatível
        iabbrev comunicacao comunicação
        iabbrev comunicacoes comunicações
        iabbrev conexao conexão
        iabbrev confusao confusão
        iabbrev estatisticas estatísticas
        iabbrev experiencia experiência
        iabbrev experiencia experiência
        iabbrev codigo código
        iabbrev inorganico inorgânico
        iabbrev integracao integração
        iabbrev manutencao manutenção
        iabbrev modificacao modificação
        iabbrev nao não
        iabbrev navegacao navegação
        iabbrev orcamento orçamento
        iabbrev organico orgânico
        iabbrev otimizacao otimização 
        iabbrev portugues português
        iabbrev promocoes promoções
        iabbrev proxima próxima
        iabbrev saida saída
        iabbrev sao são
        iabbrev servicos serviços
        iabbrev situacao situação
        iabbrev subsidiarios subsidiários
        iabbrev tambem também
        iabbrev teh the
        iabbrev usuario usuário
        iabbrev voce você
        iabbrev waht what
        iabbrev sequencia sequência
        iabbrev acessivel acessível
        iabbrev reference referência
        iabbrev crianca criança
        iabbrev criancas crianças
        iabbrev variavel variável
        iabbrev memoria memória
        iabbrev definicao definição
        iabbrev aplicacoes aplicações
        iabbrev computacao computaçao
        iabbrev padrao padrão
    endif
enddef
nnoremap <leader>tp <ScriptCmd> TogglingPort()<CR>

colorscheme bonbasi

# Syntax optimization settings
# set synmaxcol=300           # Only highlight first 300 columns
# set lazyredraw              # Don't redraw during macros
# set ttyfast                 # Faster terminal connection

# Filetype-specific optimizations
augroup VuePerformance
  autocmd!
  autocmd FileType vue set synmaxcol=500
  autocmd FileType vue syntax sync minlines=100 maxlines=250
augroup END

# g:vim_markdown_conceal = 1
# g:vim_markdown_conceal_code_blocks = 1


# TROUBLESHOOTING
# :profile start profile.log
# :profile func *
# :profile file *

# NOTES: Polyglot 2025-10-24
# vim-polyglot verwijderd op 2025-10-24, onnodig zwaar, en weet niet meer
# waarom het nuttig is, aangezien 1) vim-basics erg goed zijn en 2)
# vim-polyglot vrijwel nooit geupdate wordt


# DOTNET: 
# geen omnisharp-vim gebruiken
# wel csharp-ls gebruiken
# coc-settings bevat lsp info:
#     "languageserver": {
#         "csharp-ls": {
#             "command": "csharp-ls",
#             "filetypes": [
#                 "cs"
#             ],
#             "rootPatterns": [
#                 "*.csproj",
#                 ".vim/",
#                 ".git/",
#                 ".hg/"
#             ]
#         }
#     }


# command! -nargs=0 FormatDebug call FormatDebug()
# command! -nargs=0 CheckFormatters call CheckFormatters()
# 
# def FormatDebug()
#     echo "=== Coc Formatting Debug Information ==="
#     echo ""
# 
#     # Basic buffer information
#     echo "Buffer Information:"
#     echo "  Filetype: " .. &filetype
#     echo "  Buffer: " .. bufname()
#     echo "  File: " .. expand('%:p')
#     echo ""
# 
#     # Check Coc status
#     echo "Coc Status:"
#     try
#         var info = coc#rpc#request('getState', [])
#         echo "  Coc State: " .. string(info)
#     catch
#         echo "  Coc State: Unable to retrieve"
#     endtry
#     echo ""
# 
#     # Check extensions
#     echo "Coc Extensions:"
#     try
#         var extensions = coc#rpc#request('listExtensions', [])
#         if !empty(extensions)
#             for ext in extensions
#                 if ext.id =~? 'biome\|prettier\|formatter'
#                     echo "  " .. ext.id .. " (active: " .. ext.state .. ")"
#                 endif
#             endfor
#         else
#             echo "  No extensions found"
#         endif
#     catch
#         echo "  Unable to retrieve extensions"
#     endtry
#     echo ""
# 
#     # Check LSP clients
#     echo "LSP Clients:"
#     try
#         var clients = coc#client#getClients()
#         if !empty(clients)
#             for client in clients
#                 echo "  " .. client.id .. " - " .. client.name
#                 if has_key(client, 'config')
#                     var config = client.config
#                     if has_key(config, 'filetypes')
#                         echo "    Filetypes: " .. string(config.filetypes)
#                     endif
#                     if has_key(config, 'capabilities')
#                         var caps = config.capabilities
#                         if has_key(caps, 'documentFormattingProvider')
#                             echo "    Formatting: " .. string(caps.documentFormattingProvider)
#                         endif
#                     endif
#                 endif
#             endfor
#         else
#             echo "  No LSP clients found"
#         endif
#     catch
#         echo "  Unable to retrieve LSP clients"
#     endtry
#     echo ""
# 
#     # Check document capabilities
#     echo "Document Capabilities:"
#     try
#         var docCaps = coc#rpc#request('documentCapabilities', [])
#         if !empty(docCaps)
#             echo "  Formatting: " .. string(get(docCaps, 'formatting', 'Not available'))
#             echo "  Range Formatting: " .. string(get(docCaps, 'rangeFormatting', 'Not available'))
#         else
#             echo "  No document capabilities"
#         endif
#     catch
#         echo "  Unable to retrieve document capabilities"
#     endtry
#     echo ""
# 
#     # Check available actions
#     echo "Available Actions:"
#     try
#         var actions = coc#rpc#request('availableActions', [])
#         if !empty(actions)
#             for action in actions
#                 if action =~? 'format'
#                     echo "  " .. action
#                 endif
#             endfor
#         else
#             echo "  No format actions found"
#         endif
#     catch
#         echo "  Unable to retrieve actions"
#     endtry
#     echo ""
# 
#     # Test format command
#     echo "Testing Format Command:"
#     try
#         var result = coc#rpc#request('format', [])
#         echo "  Format request result: " .. string(result)
#     catch /E605/
#         echo "  Format action not available"
#     catch
#         echo "  Error testing format: " .. v:exception
#     endtry
# enddef
# 
# def CheckFormatters()
#     echo "=== Available Formatters ==="
#     echo ""
# 
#     # Check CocAction format
#     echo "CocAction Format:"
#     try
#         var result = CocAction('format')
#         echo "  Result: " .. string(result)
#     catch
#         echo "  Error: " .. v:exception
#     endtry
#     echo ""
# 
#     # Check specific formatter commands
#     echo "Formatter Commands:"
#     var formatters = ['biome', 'prettier', 'eslint', 'tsserver', 'lua', 'python']
#     for formatter in formatters
#         try
#             var output = coc#rpc#request('runCommand', [formatter .. '.version'])
#             echo "  " .. formatter .. ": " .. string(output)
#         catch
#             # Silent catch - formatter probably not available
#         endtry
#     endfor
#     echo ""
# 
#     # Check buffer-specific formatters
#     echo "Buffer Formatters:"
#     try
#         var bufFormatters = coc#rpc#request('formatters', [])
#         if !empty(bufFormatters)
#             for fmt in bufFormatters
#                 echo "  " .. fmt
#             endfor
#         else
#             echo "  No buffer-specific formatters"
#         endif
#     catch
#         echo "  Unable to retrieve buffer formatters"
#     endtry
# enddef
# 
# # Helper function to check if Biome is active
# def BiomeStatus(): string
#     try
#         var clients = coc#client#getClients()
#         for client in clients
#             if client.name =~? 'biome'
#                 return "Biome LSP: Active (PID: " .. get(client, 'pid', 'unknown') .. ")"
#             endif
#         endfor
#         return "Biome LSP: Not found"
#     catch
#         return "Biome LSP: Error checking"
#     endtry
# enddef
# 
# command! -nargs=0 BiomeCheck echo BiomeStatus()
# 
# # Simple one-line formatter check
# def QuickFormatCheck()
#     echo "Quick Format Check:"
#     echo "  Filetype: " .. &filetype
#     echo "  " .. BiomeStatus()
# 
#     try
#         var clients = coc#client#getClients()
#         echo "  Active LSP clients: " .. len(clients)
#         for client in clients
#             if has_key(client, 'config') && has_key(client.config, 'capabilities')
#                 var caps = client.config.capabilities
#                 if has_key(caps, 'documentFormattingProvider') && caps.documentFormattingProvider
#                     echo "  → " .. client.name .. " provides formatting"
#                 endif
#             endif
#         endfor
#     catch
#         echo "  Error checking LSP clients"
#     endtry
# enddef
# 
# command! -nargs=0 QuickFormatCheck call QuickFormatCheck()
# 
# echo "Format debugging commands loaded:"
# echo "  :FormatDebug    - Comprehensive formatting information"
# echo "  :CheckFormatters - List available formatters"
# echo "  :BiomeCheck     - Check Biome LSP status"
# echo "  :QuickFormatCheck - Quick format capability check"

# Macro: Enhanced macro playback that expands snippets
def PlaySnippetAwareMacro()
    var register = v:register == '"' ? 'a' : v:register
    var macro_content = getreg(register)

    if macro_content == ""
        echohl ErrorMst 

        echo "Macro register '" .. register .. "' is empty"
        echohl None
        return
    endif

    # Use feedkeys with 'x' mode to allow mapping and snippet expansion
    feedkeys("@" .. register, 'x')

    # If the macro contains snippet triggers, give them time to expand
    if macro_content =~ '\<Tab>\|\<C-y>\|\<C-r>='
        # Small delay to allow snippet processing
        timer_start(950, (t) => { 
            echo 'doen we wat?'

            # do nothing, just delay
        })
    endif
enddef

# Map <leader>q to snippet-aware macro playback
nnoremap <leader>Q <ScriptCmd>PlaySnippetAwareMacro()<CR>

# Optional: Also make the repeat command (@@) snippet-aware
nnoremap @@ <ScriptCmd>PlaySnippetAwareMacro()<CR>
