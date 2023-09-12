vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local km = vim.keymap

km.set({ 'n', 'v' }, '<C-z>', '<nop>', { desc = 'Disable CTRL-Z which exits in a super weird way' })
km.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
km.set('n', 'k', 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true, desc = 'deal with word wrap' })
km.set('n', 'j', 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true, desc = 'deal with word wrap' })

km.set('n', '<A-j>', "V:m '<+1<CR>gv=gv", { desc = 'Switch to visiual mode and move current line down by 1' })
km.set('n', '<A-k>', "V:m '>-2<CR>gv=gv", { desc = 'Switch to visiual mode and move current line up by 1' })
km.set('v', '<A-j>', ":m '<+1<CR>gv=gv", { desc = 'Move current line down by 1' }) -- TODO: needs refining, only does 1 line, should do all of selected
km.set('v', '<A-k>', ":m '>-2<CR>gv=gv", { desc = 'Move current line up by 1' })   -- TODO: needs refining, only does 1 line, shoudl do all of selected

-- ----------------------------------------------
-- prettier , nagaan of configs in nvim nodig zijn, of een enkele npm install -g prettier voldoende is, die kan overschrijven op projectniveau
km.set('n', '<leader>fp', ':! prettier --write %<CR>', { silent = true, desc = '[F]ormat with [P]rettier]' })
-- ----------------------------------------------










-- ----------------------------------------------

km.set('n', '<C-j>', 'Vyp', { desc = 'Duplicate active line down [J]' })
-- km.set('n','K','Vgc',{desc="comment a line"})

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
