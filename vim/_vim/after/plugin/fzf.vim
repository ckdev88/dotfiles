vim9script

# ./vim/after/plugin/mappings-fzf.vim
# depends on: 
#   - junegunn/fzf.vim
#   - fzf, rg installed (linux/bsd)
# set rtp+=~/.vim/pack/plugins/start/fzf.vim

g:fzf_layout = { 'window': { 'width': 1, 'height': 1 } }

# Popup: search stuffs
nnoremap F :FZF<CR>
nnoremap <C-f> :Rg<CR>

# Search contents only (ignore filenames)
nnoremap <C-_> <ScriptCmd>
    \ fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case ' .. fzf#shellescape(input('Search (contents only): ')), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), 0)<CR>

# RipGrep search current word in files
nnoremap <leader>rg <ScriptCmd>
  \ fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case ' .. fzf#shellescape(expand('<cword>')), 1, fzf#vim#with_preview({'options': '--delimiter : --with-nth 3..'}), 0)<CR>

# RipGrep search selected text in visual mode
vnoremap <leader>rg y<ScriptCmd>
    \ fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case ' .. fzf#shellescape(@0), 1, fzf#vim#with_preview({'options': '--delimiter : --with-nth 3..'}), 0)<CR>

# RipGrep with file paths: search current word in files
nnoremap <leader>rG <ScriptCmd>
    \ fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case ' .. fzf#shellescape(expand('<cword>')), 1, fzf#vim#with_preview(), 0)<CR>

# RipGrep with file paths: search selected text in visual mode
vnoremap <leader>rG y<ScriptCmd>
    \ fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case ' .. fzf#shellescape(@0), 1, fzf#vim#with_preview(), 0)<CR>
