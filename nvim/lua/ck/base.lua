vim.cmd('autocmd!')
local vo = vim.opt

vim.scriptencoding = 'utf-8'
vo.encoding = 'utf-8'
vo.fileencoding = 'utf-8'

vo.autoindent = true
vo.expandtab = false
vo.shiftwidth = 4
vo.tabstop = 4
vo.softtabstop = 4
vo.smarttab = true
vo.ai = true
vo.si = true
vo.breakindent = true

vo.number = true
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

vo.updatetime = 50
