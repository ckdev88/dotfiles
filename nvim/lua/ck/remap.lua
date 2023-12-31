vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
local k = vim.keymap

-- disable defaults for keys
k.set({ 'n', 'v' }, '<C-z>', '<nop>', { desc = 'Disable CTRL-Z which exits in a super weird way' })
k.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
k.set('n', 'q', '<nop>', { desc = 'disable macro shortcut, TODO: define later on different key' })
k.set('n','<Esc>',':noh<CR>',{silent=true, noremap=true,desc='add :noh to esc key map'})

-- line manipulation
k.set('n', '<C-j>', 'Vyp', { desc = 'Duplicate active line down' })
k.set('v', '<C-j>', ":copy'><CR>gv=gv", { desc = 'Duplicate selection below ' })
k.set('n', '<C-k>', 'VyP', { desc = 'Duplicate active line up' })
k.set('v', '<C-k>', ':copy-1<CR>gv=gv', { desc = 'Duplicate selection above' })

k.set('n', '<A-j>', ":move+<CR>", { desc = 'move single line down in normal mode -- plus ' })
k.set('n', '<A-k>', ":move-2<CR>", { desc = 'move single line up in normal mode -- min twee' })
k.set('v', '<A-j>', ":move'>+<CR>gv=gv", { desc = 'move selected a line down -- plus' })
k.set('v', '<A-k>', ":move-2<CR>gv=gv", { desc = 'move selected a line up -- min twee' })

k.set('n', 'J', 'mzJ`z', { desc = 'keep j in horizontal place' })

-- selection
k.set('n', '<C-a>', 'ggVG', { desc = '[A]ll select uniform, toggle' })
k.set('v', '<C-a>', '<Esc>2<C-o>', { desc = '[A]ll select uniform, toggle off' })

-- search-replace
k.set('n', '<leader>ra', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><left>]],
	{ desc = '[R]eplace [a]ll occurences of word on cursor position' })

-- quick modifying
k.set('n', 'U', ':redo<Return>', { desc = '[U]ndo the [u]ndo' })
k.set({ 'n' , 'v' }, '<C-s>', '<Esc>:w<CR>:silent ! prettier --write %<CR>:LspRestart<CR>',
	{ silent = true, desc = '[S]ave file & format with Prettier & restart LSPs' })

k.set('i', '<C-s>', '<Esc>:w<CR>:silent ! prettier --write %<CR>',
	{ silent = true, desc = '[S]ave file & format with Prettier' })

-- switch to previous buffer
k.set('n', '<A-[>', '<C-^><CR>', { silent = true, desc = 'Switch to last previously active buffer / alternate file (same as	:e#, but can also alternate empty file)' })


-- plugin-related remaps
-- prettier , TODO: nagaan of configs in nvim nodig zijn, of een enkele npm install -g prettier voldoende is, die kan overschrijven op projectniveau
-- ----------------------------------------------
k.set('n', '<leader>p', ":w<CR>:silent ! prettier --write %<CR>",
	{ desc = 'Format with [P]rettier' })

-- Neotree
k.set({ 'n', 'v' }, '<C-e>', ':Neotree toggle=true position=right<CR>',
	{ silent = true, desc = '[e]xplore file tree with Neotree' })
k.set({ 'n', 'v' }, '<C-b>', ':Neotree toggle=true position=right source=buffers<CR>',
	{ silent = true, desc = 'Explore [b]uffers with Neotree' })

-- Symbols-outline
k.set('n', '<C-f>', ':SymbolsOutline<Return>', { desc = 'SymbolsOutline toggle' })

-- for tabs, see :help :tab and/or press <C-w>
-- See `:help vim.o`
-- See `:help mapleader`


-- handige standaard bindings om niet te vergeten
-- 'n', <C-`> uitbreidende Visual selectie vanaf de cursor, zelfde als <C0>, daarom C-2 remapped
--

-- Git
k.set('n','<leader>gh',':0GlLog<CR>',{desc='[G]it [H]istory of current file'})

-- TODO: check if still useful
k.set('n', 'k', 'v:count == 2 ? "gk" : "k"', { expr = true, silent = true, desc = 'deal with word wrap' })
k.set('n', 'j', 'v:count == 2 ? "gj" : "j"', { expr = true, silent = true, desc = 'deal with word wrap' })
