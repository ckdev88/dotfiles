vim9script

# .vim/after/plugin/gitmodiff.vim
# requires config from gitmo.vim (imported below)

# WORKFLOW: end-to-end:
# :DiffQf          → qf lists differing files
# <CR>             → [working | target] panes open, cursor in right pane
# dp               → pull target hunk
# <leader>n        → save, close, advance, open next
# :DiffQf          → prune periodically
# :DiffClose       → close without advancing (escape hatch)

import './gitmovars.vim' as G

# --- DiffQf: populate qf with files differing from target
def DiffQf()
    var files: list<string> = systemlist(['git', 'diff', '--name-only', G.diff_target, '--', G.diff_target_subrepo])
    var items: list<dict<any>> = files->mapnew((_, f) => ({filename: f, lnum: 1, col: 1, text: ''}))
    setqflist([], 'r', {
        title: 'diff vs ' .. G.diff_target,
        items: items,
        context: {target: G.diff_target, subrepo: G.diff_target_subrepo},
    })
    copen
enddef
command! DiffQf DiffQf()

# --- QfDiffOpen: open [working | target] panes above qf, tag both for closing
def QfDiffOpen()
    var ctx: any = get(getqflist({'context': 0}), 'context', {})
    if type(ctx) != v:t_dict || empty(ctx) || !has_key(ctx, 'target')
        return
    endif
    var idx: number = line('.')
    var items = getqflist()
    if idx < 1 || idx > len(items)
        return
    endif
    var file = items[idx - 1].bufnr > 0
        ? bufname(items[idx - 1].bufnr)
        : items[idx - 1].filename

    var qf_id: number = win_getid()
    wincmd p
    if win_getid() == qf_id
        new
    endif

    execute 'edit ' .. fnameescape(file)
    execute 'Gvdiffsplit ' .. fnameescape(ctx.target) .. ':%'

    var right_id: number = win_getid()
    wincmd p
    var left_id: number = win_getid()
    setwinvar(left_id,  'is_diff_pane', 1)
    setwinvar(right_id, 'is_diff_pane', 1)

    win_gotoid(right_id)
enddef

def QfHandleEnter()
    var ctx: any = get(getqflist({'context': 0}), 'context', {})
    # if !empty(ctx) && has_key(ctx, 'target')
    if type(ctx) == v:t_dict && !empty(ctx) && has_key(ctx, 'target')
        QfDiffOpen()
    else
        feedkeys("\<CR>", 'n')
    endif
enddef

def SetupQfMappings()
    nnoremap <silent><buffer> <CR> <ScriptCmd>QfHandleEnter()<CR>
enddef

autocmd FileType qf {
    SetupQfMappings()
}

# --- CloseDiffPanes: save modified diff panes, close them, focus qf
def CloseDiffPanes()
    var diff_panes: list<number> = []
    for w in getwininfo()
        if getwinvar(w.winid, 'is_diff_pane', 0)
            if getwinvar(w.winid, '&diff')
                diff_panes->add(w.winid)
            else
                setwinvar(w.winid, 'is_diff_pane', 0)
            endif
        endif
    endfor

    # A single tagged window isn't a diff pair — treat as stale
    if len(diff_panes) == 1
        setwinvar(diff_panes[0], 'is_diff_pane', 0)
        return
    endif

    if empty(diff_panes)
        return
    endif

    for winid in diff_panes
        var bufnr = winbufnr(winid)
        if getbufvar(bufnr, '&modified') && getbufvar(bufnr, '&modifiable')
            win_execute(winid, 'silent write')
        endif
    endfor
    for winid in diff_panes
        if winnr('$') > 1
            win_execute(winid, 'close')
        else
            win_execute(winid, 'diffoff!')
            setwinvar(winid, 'is_diff_pane', 0)
        endif
    endfor

    for w in getwininfo()
        if getwinvar(w.winid, '&buftype') ==# 'quickfix'
            win_gotoid(w.winid)
            break
        endif
    endfor
enddef

# --- AdvanceQf: close panes, cnext/cprev, auto-open next diff if in DiffQf list
# Falls back to plain Vim cnext/cprev when not in the diff workflow.
def AdvanceQf(dir: string)
    CloseDiffPanes()

    if &buftype ==# 'quickfix'
        var cur: number = line('.')
        var total: number = len(getqflist())
        var target: number = cur
        if dir ==# 'cnext' && cur < total
            target = cur + 1
        elseif dir ==# 'cprev' && cur > 1
            target = cur - 1
        endif

        if target == cur
            return   # boundary — no-op instead of wrap/error
        endif

        cursor(target, 1)

        var ctx: any = get(getqflist({'context': 0}), 'context', {})
        # if !empty(ctx) && has_key(ctx, 'target')
        if type(ctx) == v:t_dict && !empty(ctx) && has_key(ctx, 'target')
            QfDiffOpen()
        endif
    else
        # Not in qf — plain Vim behaviour
        try
            execute dir
        catch
            echomsg 'AdvanceQf: ' .. v:exception
        endtry
    endif
enddef

nnoremap <leader>n <ScriptCmd>AdvanceQf('cnext')<CR>
nnoremap <leader>p <ScriptCmd>AdvanceQf('cprev')<CR>

# Optional escape hatch: close diff panes without advancing
command! DiffClose CloseDiffPanes()

## Diffs: pull/push hunks
##  commented because see :h dirdiff-leader-dg
## :vimgrep '<leader>dg' ~/.vim/pack/plugins/**/*
## Note: not sure if vim-dirdiff is actually used or useful
# nnoremap <leader>dg V:diffget<CR>
# vno <leader>dg :diffget<CR>
# nnoremap <leader>dp :'<,'>diffput<CR>
# vno <leader>dp :diffput<CR>
