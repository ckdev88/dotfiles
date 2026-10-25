vim9script

# .vim/after/plugin/sesh.vim
# Needed setting: set sessionoptions-=options

# Session: only save when using keymap
def SessionFile(): string
    return getcwd() .. '/.vim/session.vim'
enddef

def SaveSession(): void
    var file: string = SessionFile()
    var dir: string = file->fnamemodify(':h')
    if !isdirectory(dir)
        dir->mkdir('p')
    endif
    execute('mksession! ' .. fnameescape(file))
    echo 'Session saved: ' .. fnameescape(file)
enddef
nnoremap <leader>qa <ScriptCmd>SaveSession()<Bar>:qa<CR>

def LoadSession(): void
    echo 'loading session'
    if argc() > 0
        return 
    endif
    var file: string = SessionFile()
    if file->filereadable()
        execute('silent! source ' .. fnameescape(file))
    endif
enddef

autocmd VimEnter * ++nested { 
    LoadSession()
}
