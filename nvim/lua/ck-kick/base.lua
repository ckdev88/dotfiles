vim.cmd('autocmd!')
vim.cmd('colorscheme slate')
local vo = vim.opt

vo.cindent = true   -- default: false
vo.tabstop = 4      -- default: 8
vo.expandtab = true -- default: false

vo.expandtab = true
vo.shiftwidth = 4

vo.number = false -- default: true
vo.scrolloff = 15
vo.showcmd = true
vo.cmdheight = 1
vo.laststatus = 2
vo.shell = 'zsh'
vo.backupskip = '/tmp/*,/private/tmp/*'
vo.termguicolors = true
vo.wildignore:append { '*/node_modules/*' }

vo.guicursor = ''
vo.cursorline = true;               -- default:false
vo.undofile = true
vo.ignorecase = true                -- case-insensitive searching unless \C or capital in search
vo.smartcase = true                 -- case-insensitive searching unless \C or capital in search
vo.breakindent = true               -- default:false

vo.signcolumn = 'yes'               -- keep signcolumn on by default (yes good? no true?)
vo.completeopt = 'menuone,noselect' -- better completion
vo.hlsearch = true                  -- highlight on search

vo.mouse = 'a'                      -- Enable mouse mode

-- Set completeopt to have a better completion experience
vo.completeopt = 'menuone,noselect'

-- See `:help vim.o`
