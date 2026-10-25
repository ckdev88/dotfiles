vim9script

# .vim/after/plugin/gitmo.vim - git-related stuff
# required: tpope/vim-fugitive, junegunn/gv.vim
# handles git operations + config
# for diff-specific methods, see gitmodiff.vim

import './gitmovars.vim' as G

nn <leader>vg :copen<CR>:vimgrep // ./src/**/* <LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>

# --- FuGITives
nn <leader>sc :Commits!<CR>
nnoremap <leader>gb :G branch<CR>
nnoremap <leader>gc :G commit -m ''<LEFT>
nnoremap <leader>gg :G log --all --graph --oneline<CR>
nnoremap <leader>gp :G push<CR>
nnoremap <leader>gs :w<CR>:G<CR>
nnoremap <leader>grc :G rebase --continue<CR>

def GvdiffAgainst(branch: string)
    echo 'Diff target: ' .. branch
    execute 'Gvdiffsplit ' .. fnameescape(branch) .. ':%'
enddef

nnoremap <leader>gdm <ScriptCmd>GvdiffAgainst(G.branchname_master)<CR>
nnoremap <leader>gde <ScriptCmd>GvdiffAgainst(G.branchname_target1)<CR>
nnoremap <leader>gdd <ScriptCmd>GvdiffAgainst(G.branchname_target2)<CR>

# requires vim-gv
nnoremap <leader>gv <ScriptCmd>GV!<CR>

# Faster :Gclog by limiting to the last 20 ... :gcl
cnoreabbrev <expr> gcl getcmdtype() ==# ':' && getcmdline() ==# 'gcl' ? 'Gclog -20' : 'gcl'

# Tracks which qf row currently carries the prefix.
var last_prefixed_line: number = -1

def GitQuickfixCheckout(prefix: string)
    if &buftype != 'quickfix'
        echohl ErrorMsg
        echomsg "GitQuickfixCheckout: not in a quickfix window"
        echohl None
        return
    endif

    var lnum: number = line('.')
    var info = getqflist({'items': 0, 'context': 0, 'title': 0})
    var items = info.items

    if empty(items)
        echomsg "GitQuickfixCheckout: quickfix list is empty"
        return
    endif

    if lnum < 1 || lnum > len(items)
        echomsg "GitQuickfixCheckout: no quickfix entry on this line"
        return
    endif

    # Hash lives in the DISPLAYED line, not in .text for :Gclog entries
    var commit_hash: string = matchstr(getline(lnum), '\v^[0-9a-f]{7,40}')
    if empty(commit_hash)
        echohl ErrorMsg
        echomsg "GitQuickfixCheckout: no commit hash on this line"
        echohl None
        return
    endif

    # Strip previous prefix, only if still present
    var strip_pat: string = '^' .. escape(prefix, '\.*[]~^$') .. '\s*'
    if last_prefixed_line >= 0 && last_prefixed_line < len(items)
        if items[last_prefixed_line].text =~# strip_pat
            items[last_prefixed_line].text = substitute(
                items[last_prefixed_line].text, strip_pat, '', '')
        endif
    endif

    # Apply new prefix
    items[lnum - 1].text = prefix .. ' ' .. items[lnum - 1].text
    last_prefixed_line = lnum - 1

    setqflist([], 'r', {
        'items':   items,
        'title':   info.title,
        'context': info.context,
    })

    execute 'normal! ' .. lnum .. 'G'
    execute 'Git checkout ' .. commit_hash
enddef
nnoremap <leader>gt <ScriptCmd>GitQuickfixCheckout('@-->')<CR>

# Conflict handling
def ConflictOurs()
    var start_line: number = search('^<<<<<<< ', 'bncW')
    if start_line == 0
        echohl WarningMsg | echomsg 'No conflict here' | echohl None
        return
    endif
# Cursor may be anywhere; anchor forward searches at start_line
    cursor(start_line, 1)
    var mid_line: number = search('^=======$', 'cW', line('$'))
    var end_line: number = search('^>>>>>>> ', 'cW', line('$'))
    if mid_line == 0 || end_line == 0
        echohl WarningMsg | echomsg 'Malformed conflict' | echohl None
        return
    endif
    execute $':{mid_line},{end_line}delete'
    execute $':{start_line}delete'
enddef

command! ConflictOurs ConflictOurs()
nnoremap <leader>guo <Cmd>ConflictOurs<CR>
# nnoremap <leader>gut <Cmd>g:ConflictTheirs()<CR> TODO make this function

def CommitWithMessagePrefix()
    var branch: string = trim(get(systemlist('git rev-parse --abbrev-ref HEAD'), 0, ''))
    var m: list<string> = matchlist(branch, '\v(^|/)' .. escape(G.current_repo, '\.*[]~^$') .. '#(\d+)')
    # if not empty, prefix should be something like `[#123] `
    var prefix: string = empty(m) ? '' : '[#' .. m[2] .. '] '
    feedkeys(   ":G commit -m '" .. prefix .. "'\<LEFT>", 'nt')
enddef

nnoremap <leader>cm <ScriptCmd>CommitWithMessagePrefix()<CR>

# Statusline: custom setup with Fugitive
def g:ShortPath(): string
    var file: string = expand('%:p')
    if empty(file)
        return &buftype ==# 'terminal' ? '[Terminal]' : '[No Name]'
    endif
    var git_path = g:FugitivePath(file, '.')
    if git_path != '.' && git_path != ''
        return git_path
    endif
    return fnamemodify(file, ':~:.')
enddef

# in comment because vimls gives (false positive?) warning
# set statusline=%<%{g:ShortPath()}\ %h%m%r%=%-1.\(%)\ %Y\ -\ %(%l,%v[%p%%]\ %)
setglobal statusline=%<%{g:ShortPath()}\ %h%m%r%=%-1.\(%)\ %Y\ -\ %(%l,%v[%p%%]\ %)


# FUGITIVE: modified commands
# alternative to `coo` to checkout branch, escaping # (comment) character in branch name
# Applicable when running :G branch command and having the cursor on target branch
nnoremap <leader>co :execute 'Git checkout' fnameescape(expand('<cfile>'))<CR>


