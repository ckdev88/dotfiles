local keymap = vim.keymap

-- selection & modification
keymap.set('n', 'x', '"_x') -- prevent yanking with x
keymap.set('n', '<C-a>', 'gg<S-v>G') -- select all

-- tabs
keymap.set('n', 'te', ':tabedit<Return>', {silent = true})
keymap.set('n','ts',':vsplit<Return><C-w>w', {silent = true})
-- keymap.set('','tt','<C-w>w<Return>') -- should be toggle prev/curr, not working
keymap.set('','ty',':tabnext<Return>')
keymap.set('','tr',':tabprevious<Return>')
keymap.set('','tq',':tabclose<Return>')
keymap.set('','','')
keymap.set('','','')
keymap.set('','','')
keymap.set('','','')

