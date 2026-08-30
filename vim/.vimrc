vim9script
#

nnoremap <SPACE> <Nop>
g:mapleader = " "
g:netrw_altfile = 1
g:netrw_liststyle = 1
g:netrw_sort_sequence = '[\/]\s'

set autoindent
set completeopt=menuone,preview
set cursorline
set cursorlineopt=number
set encoding=utf-8
set expandtab
set foldlevel=0
set foldmethod=manual
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set nobackup
set nocompatible
set norelativenumber
set nowritebackup
set number
set re=0 # for yats
set scrolloff=25
set shiftwidth=4
set signcolumn=yes
set smartindent
set softtabstop=4
set splitright
set tabstop=4
set termguicolors
set timeoutlen=800
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000
set updatetime=10000
set wildmenu
set wildoptions=pum

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
no U :redo<CR>
no <C-e> :Explore<CR>
no <C-L> :bn<CR>
no <C-H> :bp<CR>

# Shortcuts:
nn <leader>vg :copen<CR>:vimgrep // ./src/**/* <LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
nn <leader>n :cnext<CR>
nn <leader>p :cprev<CR>

# Popup: search stuffs
nn <C-b> :Buffers!<CR>
nn <leader>sh :History/!<CR>
nn <leader>ss :Snippets!<CR>

# Panels: <C-w>=

# FuGITives:
nn <leader>sc :Commits!<CR>
no <leader>gb :G branch<CR>
no <leader>gc :G commit -m ''<LEFT>
no <leader>gg :G log --all --graph --oneline<CR>
no <leader>gp :G push<CR>
# no <leader>gs :w<CR>:!bun run format<CR>:G<CR>
no <leader>gs :w<CR>:G<CR>
no <leader>gt <ScriptCmd> GitQuickfixCheckout('@-->')<CR>
no <leader>gv <ScriptCmd> GV!<CR> # requires vim-gv
no <leader>grc :G rebase --continue<CR>

# diff otherBranch with current file
no <leader>gd :Gvdiffsplit main:%<CR>

# Store the branch name in window-local variable when diff is opened
command! -nargs=1 GDiffBranch {
  set winvar(0, 'diff_branch', <q-args>)
  execute 'Gvdiffsplit ' .. <q-args> .. ':%'
}

# Function to refresh diff with better error handling
def RefreshDiff()
  # Check if we're in a diff window already
  if &diff
    return
  endif

  var branch = getbufvar(winnr('#'), 'diff_branch')
  if !empty(branch)
    # Save current position and window layout
    var curwin = winnr()
    var curbuf = bufnr()

    try
      execute 'Gvdiffsplit ' .. branch .. ':%'
      # Store the branch name on the new window too
      set winvar(winnr('#'), 'diff_branch', branch)
    catch
      echohl ErrorMsg
      echo 'Failed to diff against branch: ' .. branch
      echohl None
    endtry
  endif
enddef

# Auto-refresh when entering a buffer
augroup diff_autorefresh
  autocmd!
  autocmd BufEnter * call RefreshDiff()
augroup END

# Manual refresh command
command! GDiffRefresh RefreshDiff()

# Close diff windows and clear the branch setting
def CloseDiff()
  windo if &diff | execute 'diffoff!' | endif
  set winvar(0, 'diff_branch', '')
enddef
command! GDiffClose CloseDiff()

# Diffs:
no <leader>dg V:diffget<CR>
vno <leader>dg :diffget<CR>
no <leader>dp :'<,'>diffput<CR>
vno <leader>dp :diffput<CR>
nnoremap <leader>lipsum :Lipsum<CR>
nnoremap <leader>bd :bd<CR>:w<CR>:bd<CR>

# Vue: style or related
# jump to referenced sfc
no <leader>vd gdngf

nno <leader>ig O<!-- prettier-ignore --><Esc>j
nno <leader>iG O// prettier-ignore<Esc>j

# MISC MACROS
# replace current word with latest from register
no <leader>rw viw"0p
# no <leader>rw viwp
# cut current function, leave formatting intact, put cursor on opening curly
no <leader>cf V%d :echo 'function or declaration cut'<CR>
# delete current function
no <leader>df va{Jdd :echo 'function or declaration deleted'<CR>
# select current function
no <leader>vf [{V]} " select function
# yank current function
no <leader>yf [{V]}y

# Yank: project relative filepath/filename of current file to vim clipboard
def YankFilename()
   setreg('"', expand("%")) 
   echo "Yanked: " .. expand("%")
enddef
nnoremap yf <ScriptCmd>YankFilename()<CR>

# Yank: full filepath/filename of current file to system clipboard
def YankFilenameToSystemClipboard()
   var filepath = expand("%")
   echo "Yanked to system clipboard: " .. filepath
enddef
nnoremap yF <ScriptCmd>YankFilenameToSystemClipboard()<CR>

def YankTodo(start: number, end: number)
    var filename = expand("%")
    var datetime = strftime("%Y-%m-%d %H:%M")
    var selected = getline(start, end)

    execute "normal! \<Esc>"

    var git_output = system("git rev-parse --abbrev-ref HEAD")
    var git_branch = substitute(git_output, '\n$', '', '')
    # replace `repo_name` with the euh.. repo name
    var todo_path  = './.todo/' .. substitute(git_branch, '\(.*\)\/repo_name\#\(.*\)', '\1\_\2', '') .. '.md'

    var lines = filereadable(todo_path) ? readfile(todo_path) : []

    lines->add("")
    lines->add("## " .. filename)
    if (git_branch != "")
       lines->add(git_branch .. " *" .. datetime .. "*")
    else
       lines->add("*" .. datetime .. "*")
    endif
    lines->add("```")

    var line_nr = start
    for line in selected
        lines->add(line_nr .. ":    " .. line)
        line_nr += 1
    endfor
    lines->add("```")
    writefile(lines, todo_path)

    echo "Appended lines " .. start .. "-" .. end .. " from " .. filename .. " to " .. todo_path
enddef
command -range YankTodo YankTodo(<line1>, <line2>)
xnoremap <leader>tt :YankTodo<CR>

# select ranges -- Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
# PHP: dump/log current data
nn <leader>lp <ScriptCmd> L<CR>
# Save and refresh theme bonbasi
no <leader>rf :w<CR>:colo bonbasi<CR>

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

no <leader>ts :CocCommand tsserver.reloadProjects<CR>
no <silent> <leader>fm :w<CR>:!biome format % --write<CR>:e<CR><CR>ggG<c-o><c-o>

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

# Xorg: yank to system clipboard
def YankToSystemClipboard()
   var yankin = getreg('"')
   execute system('xclip -selection clipboard', yankin)
enddef
vn <C-y> y<ScriptCmd> YankToSystemClipboard()<CR>

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

def NpmLintRunner()
  cgetexpr system("npm run lint -- -f unix")
  copen
enddef
nnoremap <leader>nl <ScriptCmd> NpmLintRunner()<CR>

def BunCheckRunner()
  cgetexpr system('bun run check')
  copen
enddef
nnoremap <leader>bc <ScriptCmd> BunCheckRunner()<CR>
nnoremap <leader>bC :silent !bun run check-write<CR>

def NpmTscLintRunner()
    var old_errorformat = &errorformat 
    set errorformat=%f(%l\\,%c):\ %m    
    var output = system('npx tsc --noEmit')  
    var cleaned_output = substitute(output, '^|| ', '', 'g')
    cexpr cleaned_output  
    &errorformat = old_errorformat 
    if !empty(getqflist()) 
        copen
    else
        echo 'No TypeScript errors found'
    endif
enddef
nnoremap <leader>nL <ScriptCmd> NpmTscLintRunner()<CR>

def NepmTscLintRunner()
    var old_errorformat = &errorformat 
    set errorformat=%f(%l\\,%c):\ %m    
    var output = system('npm run lint-info')  
    var cleaned_output = substitute(output, '^|| ', '', 'g')
    cexpr cleaned_output  
    &errorformat = old_errorformat 
    if !empty(getqflist()) 
        copen
    else
        echo 'No esling errors found'
    endif
enddef
nnoremap <leader>nep <ScriptCmd> NepmTscLintRunner()<CR>

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

# CONVERSION: console.log(myObject[0]) to console.log('myObject[0]:', myObject[0])
nnoremap <leader>o yi(<esc>Pa:',<esc>F(a'<esc>A


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
    var commit_hash = substitute(getline(lnum), '\v^([0-9a-f]{9}).*', '\1', '')
    execute 'Git checkout ' .. commit_hash
enddef


# COC: show diagnostic on-demand
nnoremap <leader>k <Cmd>call coc#float#diagnostic()<CR>

# PACKADD NATIVE FUNCTIONS: replacing plugins
packadd! editorconfig
packadd comment
# # packadd editorconfig # editorconfig working properly since Vim 9.1, see `:h editorconfig-install` and `:h editorconfig.txt` after that.
# packadd comment # https://vimhelp.org/usr_05.txt.html#comment-install
# hlyank-install
packadd hlyank # https://vimhelp.org/usr_05.txt.html#hlyank-install
g:hlyank_duration = 100
g:hlput_enable = 1
g:hlput_duration = 100

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

# COC: CONFIG

# onderstaande in comment op debian-based, weet niet goed waarom
def ShowDocumentation()
  if coc#rpc#request('hasProvider', ['hover'])
    coc#rpc#request('doHover', [])
  else
    feedkeys('K', 'in')
  endif
enddef
nnoremap <silent> K <ScriptCmd>call ShowDocumentation()<CR>

# COC: diagnostic
# related to:  
#     "diagnostic.messageDelay": 5000,
#     "diagnostic.messageTarget": "float"
nnoremap <leader>k <Plug>(coc-diagnostic-info)

# /COC: CONFIG

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
# @yaegassy/coc-volar-tools 0.3.3 ~/.config/coc/extensions/node_modules/@yaegassy/coc-volar-tools

# @yaegassy/coc-laravel 0.7.18 ~/.config/coc/extensions/node_modules/@yaegassy/coc-laravel
# @yaegassy/coc-intelephense 0.31.3 ~/.config/coc/extensions/node_modules/@yaegassy/coc-intelephense
# @yaegassy/coc-astro 0.9.2 ~/.config/coc/extensions/node_modules/@yaegassy/coc-astro

# au FileType python setlocal formatprg=autopep8\ -
# `pipx install autopep8` will install autopep8 into ~/.local/bin which is
# needed to format .py files

# NOTE: for coc-biome: possibly need to add to ~/.npmrc (if file not exists, create it): `coc.nvim:registry=https://registry.npmmirror.com`
# test 2026-03-02 onderstaand in comment
# inoremap <silent><expr> <TAB>
#     \ coc#pum#visible() ? coc#pum#next(1) :
#     \ CheckBackspace() ? "\<Tab>" :
#     \ coc#refresh()
# inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

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
# autocmd FileType typescript,typescriptreact,javascript,javascriptreact,vue 
# nnoremap <buffer> <silent> gf <ScriptCmd> CocAction('jumpDefinition')<CR>

# Hackyfix: refresh syntax, for vue-files (options api)
nmap <leader>rs <c-u><c-u><c-u><c-u><c-d><c-d><c-d><c-d>

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

# FZF_RIPGREP: config
# Popup: search stuffs
nnoremap F :FZF<CR>
nnoremap <C-f> :Rg<CR>

# Search contents only (ignore filenames)
nnoremap <C-_> <ScriptCmd>
\ fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '
\ .. fzf#shellescape(input('Search (contents only): ')), 1,
\ fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), 0)<CR>

# RipGrep search current word in files
nnoremap <leader>rg <ScriptCmd>
\ fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '
\ .. fzf#shellescape(expand('<cword>')), 1,
\ fzf#vim#with_preview({'options': '--delimiter : --with-nth 3..'}), 0)<CR>

# RipGrep search selected text in visual mode
vnoremap <leader>rg y<ScriptCmd>
\ fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '
\ .. fzf#shellescape(@0), 1,
\ fzf#vim#with_preview({'options': '--delimiter : --with-nth 3..'}), 0)<CR>

# RipGrep with file paths: search current word in files
nnoremap <leader>rG <ScriptCmd>
\ fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '
\ .. fzf#shellescape(expand('<cword>')), 1,
\ fzf#vim#with_preview(), 0)<CR>

# RipGrep with file paths: search selected text in visual mode
vnoremap <leader>rG y<ScriptCmd>
\ fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '
\ .. fzf#shellescape(@0), 1,
\ fzf#vim#with_preview(), 0)<CR>

inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--ansi --delimiter : --nth 3..',
  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

# FUGITIVE: Statusline
# old version: set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-1.\(%)\ %Y\ -\ %(%l,%v[%p%%]\ %)
def ShortPath(): string
  var file = expand('%:p')
  var git_path = g:FugitivePath(file, '.')
  if git_path != '.' && git_path != ''
    return git_path
  endif
  return fnamemodify(file, ':~:.')
enddef

# Legacy wrapper for statusline
def g:ShortPath(): string
  return ShortPath()
enddef

set statusline=%<%{g:ShortPath()}\ %h%m%r%{FugitiveStatusline()}%=%-1.\(%)\ %Y\ -\ %(%l,%v[%p%%]\ %)

# FUGITIVE: modified commands
# alternative to `coo` to checkout branch, escaping # (comment) character in branch name
nnoremap <leader>co :execute 'Git checkout' fnameescape(expand('<cfile>'))<CR>

 # Abbreviations: General -- see :digraphs / :dig!
iabbrev dgstar ☆
iabbrev dgstar2 ★
iabbrev dgok ✓
iabbrev dgx ✗
iabbrev dgplay ▶

autocmd FileType markdown syntax match SpecialKeyFail /\v✗/
autocmd FileType markdown syntax match SpecialKeyOK /\v✓/

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

augroup TodoHighlight
  autocmd!
  autocmd BufRead,BufNewFile * match TodoLine /.*TODO.*/
augroup END



# Syntax optimization settings
# set synmaxcol=300           # Only highlight first 300 columns
# set lazyredraw              # Don't redraw during macros
# set ttyfast                 # Faster terminal connection

# Performance: syntax highlight parsing
# Increase the number of lines Vim looks back for syntax highlighting
au BufEnter * :syntax sync minlines=1500

##  Filetype-specific optimizations (commented because line above)
# augroup VuePerformance
#     autocmd!
#     autocmd FileType vue syntax sync minlines=500 maxlines=1500
# augroup END

# experimental 2026-03-02 for quicker vue autosuggest
autocmd FileType vue inoremap <buffer> <C-Space> <C-x><C-u>


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

# Dependencies: Fzf & fzf.vim bronnen
# set rtp+=~/.vim/pack/plugins/start/fzf.vim
set rtp+=~/.fzf

# CoC & LSP, only suggest LSP options
# inoremap <buffer> <C-l> <C-x><C-u>


# g:ollama_host = 'http://localhost:11434'
# USE THE QUANTIZED VERSION
# g:ollama_model = 'qwen2.5-coder:7b-instruct-q4_K_M'
# g:ollama_chat_model = 'qwen2.5-coder:7b-instruct-q4_K_M'
# g:ollama_edit_model = 'qwen2.5-coder:7b-instruct-q4_K_M'

# GENEROUS TIMEOUTS (your 7B model needs these)
# g:ollama_chat_timeout = 240 
# g:ollama_edit_timeout = 240 

# Disable auto-completion
# g:ollama_complete_on_enter = 0
# g:ollama_complete_delay_ms = 0

nnoremap <leader>lls :Ollama enable
nnoremap <leader>llc :OllamaChat<CR>
vnoremap <leader>llr :OllamaReview<CR>
vnoremap <leader>llt :OllamaTask 
nnoremap <leader>lld :Ollama disable<CR>
# # LLM: of SLM/Ollama/Qwen
# # load ollama config first
# source ~/.vim/config/ollama.vim

# ~/.vim/pack/plugins/start/vim-ollama/autoload/ollama/config.vim
# add: qwen2.5-coder:7b-instruct-q4_K_M

# UltiSnips
set runtimepath+=~/.vim/ultisnips_rep

