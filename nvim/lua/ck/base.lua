vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.autoindent = true
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.ai = true -- Auto indent
vim.opt.si = true -- Smart indent
vim.opt.breakindent = true

vim.opt.number = true
vim.opt.scrolloff = 20
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.shell = 'fish'
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.termguicolors = true
-- vim.opt.path:append { '**' } -- Also search in subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

vim.opt.termguicolors = true
-- vim.opt.winblend = 0
-- vim.opt.wildoptions = 'pum'
-- vim.opt.pumblend = 5
