local km = vim.keymap
vim.g.mapleader = ' '
km.set('n', '<leader>e', ':Ex<Return>', { desc = '[E]plore files' })
km.set('n', 'x', '"_x', { desc = '[X]nay yank on x' })
km.set('n', 'U', ':redo<Return>', { desc = '[U]ndo the [u]ndo' })

km.set('n', '<C-a>', 'gg<S-v>G', { desc = '[A]ll select uniform, toggle' })
km.set("v", "J", ":m '<+1<CR>gv=gv", { desc = "[L] selected line (down)" }) -- TODO: needs refining
km.set("v", "K", ":m '>-2<CR>gv=gv", { desc = "[K] selected line (up)" })   -- TODO: needs refining
km.set('n', '<leader>de', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><left>]],
	{ desc = 'Change all occurences of word on cursor position' })

km.set('n', 'J', 'mzJ`z', { desc = 'keep j in horizontal place' })
km.set('v', '<leader>y', "\"+y")


-- disables
-- nnoremap <c-z> <nop> -- TODO: test
-- nnoremap <C-z> <nop> -- TODO: test

-- tabs
-- km.set('n', 'te', ':tabedit<Return>', {silent = true})
-- km.set('n','ts',':vsplit<Return><C-w>w', {silent = true})
-- km.set('','tt','<C-w>w<Return>') -- should be toggle prev/curr, not working
-- km.set('','ty',':tabnext<Return>')
-- km.set('','tr',':tabprevious<Return>')
-- km.set('','tq',':tabclose<Return>')
