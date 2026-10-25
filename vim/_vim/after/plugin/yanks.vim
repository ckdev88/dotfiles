vim9script

# .vim/after/plugin/yanks.vim

import './gitmovars.vim' as G
var ticketPrefix = G.current_repo

# Resolve the buffer's path as: git-repo-relative if in a repo,
# otherwise cwd-relative, otherwise absolute.
def BufferRelativePath(repo_root: string = ''): string
    var abs_path: string = expand("%:p")
    if empty(abs_path)
        return ''
    endif

    var base: string = ''
    if !empty(repo_root)
        base = repo_root
    else
        var root: string = get(systemlist("git rev-parse --show-toplevel"), 0, '')
        base = (v:shell_error == 0 && !empty(root)) ? root : getcwd()
    endif

    var prefix: string = base .. '/'
    return stridx(abs_path, prefix) == 0
        ? strpart(abs_path, len(prefix))
        : abs_path
enddef

# Xorg: yank to system clipboard
def YankToSystemClipboard()
    var yankin = getreg('"')
    if has('clipboard_working')
        setreg('+', yankin)
    else 
        system('xclip -selection clipboard', yankin)
    endif
enddef
vn <C-y> y<ScriptCmd>YankToSystemClipboard()<CR>

def YankFilename()
    var path: string = BufferRelativePath()
    if empty(path)
        echo 'No filename for this buffer'
        return
    endif
    setreg('"', path)
    echo "Yanked: " .. path
enddef
nnoremap yf <ScriptCmd>YankFilename()<CR>

def YankFilenameToSystemClipboard()
    var path: string = BufferRelativePath()
    if empty(path)
        echo 'No filename for this buffer'
        return
    endif
    if has('clipboard_working')
        setreg('+', path)
    else
        system('xclip -selection clipboard', path)
        if v:shell_error != 0
            echohl ErrorMsg
            echo 'xclip failed; is it installed and is X/Wayland available?'
            echohl None
            return
        endif
    endif
    echo "Yanked to system clipboard: " .. path
enddef
nnoremap yF <ScriptCmd>YankFilenameToSystemClipboard()<CR>

# Yank: mark Todo's and put them somewhere useful
def YankTodo(start: number, end: number)
    var repo_root: string = get(systemlist("git rev-parse --show-toplevel"), 0, '')
    if v:shell_error != 0 || empty(repo_root)
        echohl ErrorMsg
        echo "YankTodo: not inside a git repository"
        echohl None
        return
    endif

    var filename: string = BufferRelativePath(repo_root)
    if empty(filename)
        echohl ErrorMsg
        echo "YankTodo: no filename for this buffer"
        echohl None
        return
    endif

    var git_branch: string = get(systemlist("git rev-parse --abbrev-ref HEAD"), 0, '')

    var safe_branch: string = substitute(git_branch, '\/' .. ticketPrefix ..'#', '_', '')
    safe_branch = substitute(safe_branch, '/', '_', 'g')
    if empty(safe_branch)
        safe_branch = 'detached'
    endif

    var datetime: string = strftime("%Y-%m-%d %H:%M")
    var selected: list<string> = getline(start, end)

    var todo_dir:  string = repo_root .. '/.todo'
    var todo_path: string = todo_dir .. '/' .. safe_branch .. '.md'

    var block: list<string> = []
    block->add("")
    block->add("## " .. filename)
    block->add(!empty(git_branch)
        ? git_branch .. " *" .. datetime .. "*"
        : "*" .. datetime .. "*")
    block->add("```")
    var line_nr: number = start
    for line in selected
        block->add(line_nr .. ":    " .. line)
        line_nr += 1
    endfor
    block->add("```")

    try
        mkdir(todo_dir, 'p')
        var existing: list<string> =
            filereadable(todo_path) ? readfile(todo_path) : []
        if writefile(existing + block, todo_path) != 0
            throw 'YankTodo: writefile failed'
        endif
    catch
        echohl ErrorMsg
        echo "YankTodo: could not write to " .. todo_path
            .. " (" .. v:exception .. ")"
        echohl None
        return
    endtry

    echo "Appended lines " .. start .. "-" .. end
        .. " from " .. filename .. " to " .. todo_path
enddef
command! -range YankTodo YankTodo(<line1>, <line2>)
xnoremap <leader>tt :YankTodo<CR>
