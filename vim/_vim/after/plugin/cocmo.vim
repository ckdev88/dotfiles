vim9script

g:coc_diagnostic_enable_float = 0

# .vim/after/plugin/cocmo.vim

# COC: CONFIG
def ShowDocumentation()
    if coc#rpc#request('hasProvider', ['hover'])
        coc#rpc#request('doHover', [])
    else
        feedkeys('K', 'in')
    endif
enddef
nnoremap <silent> K <ScriptCmd>ShowDocumentation()<CR>

# CoC: Shortcuts/mappings 
# Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
			\ : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

# Highlight the symbol and its references when holding the cursor
# nice feature, but dont want it right now
# autocmd CursorHold * silent call CocActionAsync('highlight')

# Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

# Format: hotkeys/coc
# Add `:Format` command to format current buffer
command! -nargs=0 Format coc#rpc#request('format', [])
no <leader>ff :Format<CR>
# below does not work with every lsp (i.e. volar, which will format the whole file)
xmap <silent> <leader>fa <Plug>(coc-format-selected)
nmap <silent> <leader>fa <Plug>(coc-format-selected)

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
nnoremap <leader>cde <ScriptCmd>coc#config('diagnostic.messageTarget', 'echo')<CR>
nnoremap <leader>cdf <ScriptCmd>coc#config('diagnostic.messageTarget', 'float')<CR>
nnoremap <leader>cdx <ScriptCmd>coc#config('diagnostic.virtualTextCurrentLineOnly',1)<Bar>coc#config('diagnostic.virtualText',0)<CR>
nnoremap <silent> <leader>cdv1 <ScriptCmd>coc#config('diagnostic.virtualText',1)<Bar>:CocRestart<CR>
nnoremap <silent> <leader>cdv0 <ScriptCmd>coc#config('diagnostic.virtualText',0)<Bar>:CocRestart<CR>

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

# Jump-to-definition for gf in TypeScript/JS files
# Commented 2025-11-04 - Vue works better this way, dno about React yet
# autocmd FileType typescript,typescriptreact,javascript,javascriptreact,vue 
# nnoremap <buffer> <silent> gf <ScriptCmd> CocAction('jumpDefinition')<CR>

# COC: diagnostic
# related to:  
#     "diagnostic.messageDelay": 5000,
#     "diagnostic.messageTarget": "float"
nnoremap <leader>k <Plug>(coc-diagnostic-info)

# COC: open mdn link in popup window van :doHover 
# Open the first URL found in the current hover documentation.
def OpenHoverURL(): void
    # Use the RPC call directly; CocAction may not be available in vim9script.
    var hover_lines: list<string>
    try
        hover_lines = coc#rpc#request('getHover', [])
    catch
        echom 'Error getting hover: ' .. v:exception
        return
    endtry

    if empty(hover_lines)
        echom 'No hover information available'
        return
    endif

    var content: string = join(hover_lines, "\n")
    var url: string = matchstr(content, 'https\?://[^ \t\n"'')]*')

    if empty(url)
        echom 'No URL found in hover'
        return
    endif

    if has('mac')
        job_start(['open', url])
    elseif has('unix')
        job_start(['xdg-open', url])
    elseif has('win32')
        job_start(['cmd', '/c', 'start', '', url])
    endif

    echom 'Opening: ' .. url
enddef

nnoremap <silent> <leader>mdn <ScriptCmd>OpenHoverURL()<CR>
 # /COC: open mdn link in popup window van :doHover
