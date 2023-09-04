vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local km = vim.keymap

km.set({ 'n', 'v' }, '<C-z>', '<nop>', { desc = 'Disable CTRL-Z which exits in a super weird way' })
km.set('n', 'x', '"_x', { desc = '[X]nay yank on x' })
km.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
km.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = 'deal with word wrap' })
km.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = 'deal with word wrap' })

km.set("v", "J", ":m '<+1<CR>gv=gv", { desc = "[L] selected line (down)" }) -- TODO: needs refining, only does 1 line
km.set("v", "K", ":m '>-2<CR>gv=gv", { desc = "[K] selected line (up)" })   -- TODO: needs refining, only does 1 line

km.set('v', '<leader>cd', 'yp<CR>gv=gv', { desc = "duplicate selected line and keep new in selected visual mode" })

km.set('n', '<leader>ra', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><left>]],
	{ desc = '[R]eplace [a]ll occurences of word on cursor position' })

km.set('n', 'J', 'mzJ`z', { desc = 'keep j in horizontal place' })

km.set('n', 'U', ':redo<Return>', { desc = '[U]ndo the [u]ndo' })
km.set('n', '<C-a>', 'gg<S-v>G', { desc = '[A]ll select uniform, toggle' })

-- Neotree
km.set({ 'n', 'v', 'i' }, '<C-e>', ':Neotree toggle=true position=right<Return>',
	{ desc = '[e]xplore file tree with Neotree' })
km.set({ 'n', 'v', 'i' }, '<C-b>', ':Neotree toggle=true position=right source=buffers<Return>',
	{ desc = 'Explore [b]uffers with Neotree' })

-- for tabs, see :help :tab and/or press <C-w>
-- See `:help vim.o`
-- See `:help mapleader`