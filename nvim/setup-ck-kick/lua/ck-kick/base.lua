vim.cmd('autocmd!')
local vo = vim.opt

vim.scriptencoding = 'utf-8'
vo.encoding = 'utf-8'
vo.fileencoding = 'utf-8'

-- vo.cindent = false
vo.autoindent = true
vo.expandtab = true
vo.shiftwidth = 4
vo.tabstop = 4
vo.softtabstop = 4
-- vo.smarttab = true
-- vo.ai = true
-- vo.si = true
-- vo.breakindent = true

vo.number = true -- line numbers default
vo.scrolloff = 20
vo.showcmd = true
vo.cmdheight = 1
vo.laststatus = 2
vo.shell = 'fish'
vo.backupskip = '/tmp/*,/private/tmp/*'
vo.termguicolors = true
vo.wildignore:append { '*/node_modules/*' }

vo.termguicolors = true
vo.guicursor = ''

vo.undofile = true

vo.ignorecase = true -- case-insensitive searching unless \C or capital in search
vo.smartcase = true  -- case-insensitive searching unless \C or capital in search

-- decrease update time
vo.updatetime = 250
vo.timeoutlen = 300

vo.signcolumn = 'yes'               -- keep signcolumn on by default (yes good? no true?)
vo.completeopt = 'menuone,noselect' -- better completion
-- vo.hlsearch = true                  -- highlight on search
vo.cursorline = true

vo.mouse = 'a' -- Enable mouse mode


-- Set completeopt to have a better completion experience
vo.completeopt = 'menuone,noselect'

-- See `:help vim.o`
-- See `:help mapleader`
