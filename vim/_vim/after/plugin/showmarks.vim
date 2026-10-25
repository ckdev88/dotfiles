vim9script

# .vim/after/plugin/showmarks.vim

for ch: string in split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', '\zs')
    sign_define('mk_' .. ch, {text: ch})
endfor

def g:RefreshMarks(): void
    var buf: number = bufnr()
    if buf < 0
        return
    endif
    sign_unplace('marks', {buffer: buf})
    for m: dict<any> in getmarklist(buf)
        var name: string = m.mark
        if name !~ "^'[a-zA-Z]$"
            continue
        endif
        var ch: string = name[1]
        var lnum: number = m.pos[1]
        sign_place(0, 'marks', 'mk_' .. ch, buf, {lnum: lnum})
    endfor
enddef

command! RefreshMarks g:RefreshMarks()

augroup ShowMarks
    autocmd!
    autocmd VimEnter,BufEnter,CursorHold * g:RefreshMarks()
augroup END
