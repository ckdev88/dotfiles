vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local k = vim.keymap

k.set({ 'n', 'v' }, '<C-z>', '<nop>', { desc = 'Disable CTRL-Z which exits in a super weird way' })
k.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
k.set('n', 'q', '<nop>', { desc = 'disable macro shortcut, TODO: define later on different key' })
k.set('n', 'k', 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true, desc = 'deal with word wrap' })
k.set('n', 'j', 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true, desc = 'deal with word wrap' })

k.set('n', '<A-j>', "V:m '<+1<CR>gv=gv", { desc = 'Switch to visual mode and move current line down by 1' })
k.set('n', '<A-k>', "V:m '>-2<CR>gv=gv", { desc = 'Switch to visual mode and move current line up by 1' })
k.set('v', '<A-j>', ":m '<+1<CR>gv=gv", { desc = 'Move current line down by 1' }) -- TODO: needs refining, only does 1 line, should do all of selected
k.set('v', '<A-k>', ":m '>-2<CR>gv=gv", { desc = 'Move current line up by 1' })   -- TODO: needs refining, only does 1 line, shoudl do all of selected

-- ----------------------------------------------
-- prettier , nagaan of configs in nvim nodig zijn, of een enkele npm install -g prettier voldoende is, die kan overschrijven op projectniveau
k.set('n', '<leader>fp', ":w<CR>:silent ! prettier --write %<CR>",
	{ desc = '[F]ormat with [P]rettier]' })
-- ----------------------------------------------










-- ----------------------------------------------

k.set('n', '<C-j>', 'Vyp', { desc = 'Duplicate active line down [J]' })
-- k.set('n','K','Vgc',{desc="comment a line"})

k.set('n', '<leader>ra', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><left>]],
	{ desc = '[R]eplace [a]ll occurences of word on cursor position' })

k.set('n', 'J', 'mzJ`z', { desc = 'keep j in horizontal place' })

k.set('n', 'U', ':redo<Return>', { desc = '[U]ndo the [u]ndo' })
k.set('n', '<C-a>', 'gg<S-v>G', { desc = '[A]ll select uniform, toggle' })

-- Neotree
k.set({ 'n', 'v' }, '<C-e>', ':Neotree toggle=true position=right<CR>',
	{ silent = true, desc = '[e]xplore file tree with Neotree' })
k.set({ 'n', 'v' }, '<C-b>', ':Neotree toggle=true position=right source=buffers<CR>',
	{ silent = true, desc = 'Explore [b]uffers with Neotree' })

-- experiment, switch naar vorige, meest recente buffer
k.set('n', '<A-[>', ':brewind<Return>', { silent = true, desc = 'Switch to previous buffer ([Tab])' }) -- TODO: turn these two into a toggle
k.set('n', '<A-]>', ':blast<Return>', { silent = true, desc = 'Switch to last buffer ([Tab])' })       -- TODO: turn these two into a toggle

-- Symbols-outline
k.set('n', '<C-s>', ':SymbolsOutline<Return>', { desc = 'SymbolsOutline toggle' })

-- for tabs, see :help :tab and/or press <C-w>
-- See `:help vim.o`
-- See `:help mapleader`


-- handige standaard bindings om niet te vergeten
-- 'n', <C-`> uitbreidende Visual selectie vanaf de cursor, zelfde als <C-2>, daarom C-2 remapped
--
