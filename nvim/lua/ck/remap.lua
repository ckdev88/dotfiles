local keymap = vim.keymap
vim.g.mapleader = ' '
keymap.set('n', '<leader>e', ':Ex<Return>')
keymap.set('n', 'x', '"_x')          -- prevent yanking with x
keymap.set('n', '<C-a>', 'gg<S-v>G') -- select all
keymap.set('n', 'U', ':redo<Return>')


-- disables
-- nnoremap <c-z> <nop> -- TODO: test
-- nnoremap <C-z> <nop> -- TODO: test

-- tabs
-- keymap.set('n', 'te', ':tabedit<Return>', {silent = true})
-- keymap.set('n','ts',':vsplit<Return><C-w>w', {silent = true})
-- keymap.set('','tt','<C-w>w<Return>') -- should be toggle prev/curr, not working
-- keymap.set('','ty',':tabnext<Return>')
-- keymap.set('','tr',':tabprevious<Return>')
-- keymap.set('','tq',':tabclose<Return>')
