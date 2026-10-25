vim9script

# .vim/after/plugin/showsyntax.vim

# Show syntax of item under cursor
def ShowSyntax()
    var id: number = synID(line('.'), col('.'), 1)
    var name: string = synIDattr(id, 'name')
    var linked: string = synIDattr(synIDtrans(id), 'name')
    echo name .. (name != linked ? ' -> ' .. linked : '')
enddef
nnoremap <leader>ws <ScriptCmd>ShowSyntax()<CR>
nnoremap <leader>wS :echo synstack(line('.'), col('.'))->map({_, v -> synIDattr(v, "name")})<CR>
