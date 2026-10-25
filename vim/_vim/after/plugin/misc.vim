vim9script

# .vim/after/plugin/misc.vim

# Log: console log scripts
def ConsoleLogUnder()
    normal! "xy
    const selected = getreg('x')
    const new_line: string = printf("console.log('%s:', %s)", selected, selected)
    append(line('.'), new_line)
enddef
vnoremap <leader>cl <ScriptCmd>ConsoleLogUnder()<CR><C-o><CR>j
nnoremap <leader>cl viw<ScriptCmd>ConsoleLogUnder()<CR><C-o><CR>j

# Typescript: Jumping. 
# Dumb file jumper with tsconfig alias resolution, might become obsolete if I find a better way
def DumbFileJump()
    var import_path: string = matchstr(getline('.'), '[''"]\zs[^''"]*\ze[''"]')
    if empty(import_path)
        echo "No import path found"
        return
    endif
    var tsconfig_file: string = findfile('tsconfig.json', '.;')
    if empty(tsconfig_file)
        echo "tsconfig.json not found"
        return
    endif
    var tsconfig_dir: string = fnamemodify(tsconfig_file, ':h')

    try
        var config = json_decode(join(readfile(tsconfig_file), "\n"))
        var paths = get(get(config, 'compilerOptions', {}), 'paths', {})
        for [alias, targets] in items(paths)
            var alias_base: string = substitute(alias, '\*$', '', '')
            if import_path =~# '^' .. alias_base
                var target = targets[0]
                var target_base: string = substitute(target, '\*$', '', '')
                var rest: string = substitute(import_path, '^' .. alias_base, '', '')
                var resolved: string = simplify(tsconfig_dir .. '/' .. target_base .. rest)
                if filereadable(resolved) || isdirectory(resolved)
                    execute 'edit ' .. fnameescape(resolved)
                else
                    echo "File not found: " .. fnameescape(resolved)
                endif
                return
            endif
        endfor
        echo "No matching alias found for: " .. import_path
    catch /.*/
        echo "Error parsing tsconfig.json: " .. v:exception
    endtry
enddef
nnoremap <silent> gF <ScriptCmd>DumbFileJump()<CR>

# Columns: build a nice column view when data is separated with pipes
def ColumnAlign(): void
    execute ":'<,'>!column -t -s '|' -o '|'"  
    # normal! <esc>jv$r-
enddef
vmap <leader>col <ScriptCmd>ColumnAlign()<CR>

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

