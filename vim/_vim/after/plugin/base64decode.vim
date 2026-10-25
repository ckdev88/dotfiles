vim9script

# .vim/after/plugin/base64decode.vim

# Base64: decode current line when base64 encoded bw-hash is used
def BwDecodeBase64()
    echo "decoding.."
    var line = getline('.')
    var m: list<any> = matchstrpos(line, 'bw=\zs[A-Za-z0-9+/]\+')
    if m[1] < 0
        echo 'No bw= parameter on this line'
        return
    endif
    var padded: string = m[0] .. repeat('=', (4 - len(m[0]) % 4) % 4)
    var decoded: string = substitute(
        system('printf %s ' .. shellescape(padded) .. ' | base64 -d'),
        '\n$', '', ''
    )
    setline('.', line[0 : m[1] - 1] .. decoded)
enddef
nnoremap <leader>bwd <ScriptCmd>BwDecodeBase64()<CR>
