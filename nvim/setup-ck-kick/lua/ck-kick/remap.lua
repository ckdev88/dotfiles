vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local km = vim.keymap

km.set({ 'n', 'v' }, '<C-z>', '<nop>', { desc = 'Disable CTRL-Z which exits in a super weird way' })
km.set('n', 'x', '"_x', { desc = '[X]nay yank on x' })
km.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
km.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = 'deal with word wrap' })
km.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = 'deal with word wrap' })

km.set('n', '<A-j>', "V:m '<+1<CR>gv=gv");
km.set("v", "<A-j>", ":m '<+1<CR>gv=gv", { desc = "[L] selected line (down)" }) -- TODO: needs refining, only does 1 line
km.set('n', '<A-k>', "V:m '>-2<CR>gv=gv")
km.set("v", "<A-k>", ":m '>-2<CR>gv=gv", { desc = "[K] selected line (up)" })   -- TODO: needs refining, only does 1 line

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

-- experiment, switch naar vorige, meest recente buffer
km.set('n', '<A-[>', ':brewind<Return>', { silent = true, desc = 'Switch to previous buffer ([Tab])' }) -- TODO: turn these two into a toggle
km.set('n', '<A-]>', ':blast<Return>', { silent = true, desc = 'Switch to last buffer ([Tab])' })       -- TODO: turn these two into a toggle


-- for tabs, see :help :tab and/or press <C-w>
-- See `:help vim.o`
-- See `:help mapleader`


-- handige standaard bindings om niet te vergeten
-- 'n', <C-`> uitbreidende Visual selectie vanaf de cursor, zelfde als <C-2>, daarom C-2 remapped
--
-- beperkingen om niet te vergeten
-- 'alle', <Alt - alle nummers> worden gebruikt door Konsole, fijne terminal-manager, dus niets mee doen in nvim
