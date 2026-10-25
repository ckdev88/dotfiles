vim9script

# Linting: Npm, Bun, Tsc
def BunLintRunner()
    cgetexpr system('bun run lint')
    copen
enddef
nnoremap <leader>bl <ScriptCmd>BunLintRunner()<CR>

def NpmLintRunner()
    cgetexpr system("npm run lint -- -f unix")
    copen
enddef
nnoremap <leader>nl <ScriptCmd>NpmLintRunner()<CR>

def BunCheckRunner()
    cgetexpr system('bun run check')
    copen
enddef
nnoremap <leader>bc <ScriptCmd>BunCheckRunner()<CR>
nnoremap <leader>bC :silent !bun run check-write<CR>

def NpmTscLintRunner()
    var output: string = system('npx tsc --noEmit')
    var cleaned: string = substitute(output, '^|| ', '', 'g')
    var parsed = getqflist({'lines': split(cleaned, "\n"), 'efm': '%f(%l\\,%c):\ %m'})
    setqflist([], 'r', {'items': parsed.items, 'title': 'tsc'})
    if !empty(parsed.items)
        copen
    else
        echo 'No TypeScript errors found'
    endif
enddef
nnoremap <leader>nL <ScriptCmd>NpmTscLintRunner()<CR>

def NpmEslintRunner()
    var output: string = system('npm run lint-info')
    var cleaned: string = substitute(output, '^|| ', '', 'g')
    var parsed = getqflist({'lines': split(cleaned, "\n"), 'efm': '%f(%l\\,%c):\ %m'})
    setqflist([], 'r', {'items': parsed.items, 'title': 'eslint'})
    if !empty(parsed.items)
        copen
    else
        echo 'No eslint errors found'
    endif
enddef
nnoremap <leader>nLi <ScriptCmd>NpmEslintRunner()<CR>

def BunTscLintRunner()
    var output: string = system('bunx tsc --noEmit')
    var cleaned: string = substitute(output, '^|| ', '', 'g')
    var parsed = getqflist({'lines': split(cleaned, "\n"), 'efm': '%f(%l\\,%c):\ %m'})
    setqflist([], 'r', {'items': parsed.items, 'title': 'bunx tsc'})
    if !empty(parsed.items)
        copen
    else
        echo 'No TypeScript errors found'
    endif
enddef
nnoremap <leader>bL <ScriptCmd>BunTscLintRunner()<CR>
