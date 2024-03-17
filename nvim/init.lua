-- base
vim.cmd('autocmd!')

local vo = vim.opt
vo.cindent = true
vo.tabstop = 4
vo.shiftwidth = 4
vo.number = true
vo.scrolloff = 0
vo.showcmd = true
vo.cmdheight = 1
vo.laststatus = 2
vo.shell = 'zsh'
vo.backupskip = '/tmp/*,/private/tmp/*'
vo.termguicolors = true
vo.wildignore:append { '*/node_modules/*' }
vo.guicursor          = ''
vo.cursorline         = true
vo.relativenumber     = true
vo.undofile           = true
vo.ignorecase         = true               -- case-insensitive searching unless \C or capital in search
vo.smartcase          = true               -- case-insensitive searching unless \C or capital in search
vo.breakindent        = true               -- default:false
vo.signcolumn         = 'yes'              -- keep signcolumn on by default (yes good? no true?)
vo.completeopt        = 'menuone,noselect' -- better completion
vo.hlsearch           = true               -- highlight on search
vo.mouse              = 'a'                -- Enable mouse mode
-- Set completeopt to have a better completion experience
vo.completeopt        = 'menuone,noselect'

vim.g.netrw_liststyle = 0
vim.g.netrw_banner    = 1

--
-- See `:help vim.o`

-- remap
--
vim.g.mapleader       = ' '
vim.g.maplocalleader  = ' '
local k               = vim.keymap

-- vim.cmd 'syntax sync from ReturnKeyword.vim'
-- syntax sync from 'ReturnKeyword.vim'

k.set('n', '<leader>a', ':colorsc bembasico<CR>', { desc = 'refresh theme' })
-- disable defaults for keys
k.set({ 'n', 'v' }, '<C-z>', '<nop>', { desc = 'Disable CTRL-Z which exits in a super weird way' })
k.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
k.set('n', 'q', '<nop>', { desc = 'disable macro shortcut, TODO: define later on different key' })
k.set('n', '<Esc>', ':noh<CR>', { silent = true, noremap = true, desc = 'add :noh to esc key map' })

-- -- line manipulation
k.set('n', '<C-c>', 'Vyp', { desc = 'Duplicate active line' })
k.set('v', '<C-c>', ":copy'><CR>gv=gv", { desc = 'Duplicate selection' })
k.set('n', '<C-j>', ":move+<CR>", { desc = 'move line down' })
k.set('n', '<C-k>', ":move-2<CR>", { desc = 'move single line up' })
k.set('v', '<C-j>', ":move'>+<CR>gv=gv", { desc = 'move selected a line down' })
k.set('v', '<C-k>', ":move-2<CR>gv=gv", { desc = 'move selected a line up' })

k.set('n', 'J', 'mzJ`z', { desc = 'keep j in horizontal place' })

-- search-replace
k.set('n', '<leader>ra', [[:%s/\<<C-r><C-w>\>/]], { desc = '[R]eplace [a]ll occurences of word on cursor position' })
k.set('n', '<leader>rw', 'viw"0p', { desc = '[R]eplace [w]ord with paste' })

-- quick modifying
k.set('n', 'U', ':redo<Return>', { desc = 'Undo the undo' })
k.set('n', '<leader>s', ':w<CR>', { desc = 'Save file' })

-- file navigation
k.set('n', '<C-e>', function()
	if vim.bo.filetype == 'netrw' then

		vim.cmd 'bwipeout'
	else
		vim.cmd 'Explore'
	end
end, { silent = true, desc = 'Toggle Netrw file [e]xplorer' })

k.set('n', '<C-f>', ':find ', { desc = 'look for [f]iles, replaces scrolling down a fold size command' })
k.set('n', '<C-b>', ':buffer ', { desc = 'see open [b]uffers' })

-- url navigation
k.set('n', '<leader>b', "/http<CR>yi(:new<CR>p:silent! %s/#/\\\\#/g<CR>dd:q!<CR>:silent !qutebrowser <C-r>1 &<CR>",
	{ silent = true, desc = 'Browse to URL, surrounded by ()' })

k.set('n', '<leader>fp', ":w<CR>:silent ! prettier --write %<CR>",
	{ desc = 'Format with [P]rettier' })
k.set('n', '<leader>ff', ':Format<CR>', { silent = true, desc = "Format using VIM native" })

-- for tabs, see :help :tab and/or press <C-w>
-- See `:help vim.o`
-- See `:help mapleader`

-- handige standaard bindings om niet te vergeten
-- 'n', <C-`> uitbreidende Visual selectie vanaf de cursor, zelfde als <C0>, daarom C-2 remapped

-- Git
k.set('n', '<leader>gh', ':0GlLog<CR>', { desc = '[G]it [H]istory of current file' })

-- TODO: check if still useful
k.set('n', 'k', 'v:count == 2 ? "gk" : "k"', { expr = true, silent = true, desc = 'deal with word wrap up' })
k.set('n', 'j', 'v:count == 2 ? "gj" : "j"', { expr = true, silent = true, desc = 'deal with word wrap down' })

-- plugins 
vim.cmd('colorscheme bembasico')
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	-- Git related plugins
	'tpope/vim-fugitive', -- /tpope/vim-fugitive, also see :Git difftool
	'tpope/vim-rhubarb',
	{
		-- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'williamboman/mason.nvim', opts = {} },
			'williamboman/mason-lspconfig.nvim',
			{ 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },
			'folke/neodev.nvim',
		},
	},
	{
		'hrsh7th/nvim-cmp',        -- Autocompletion
		dependencies = {
			'L3MON4D3/LuaSnip',    -- Snippet Engine & its associated nvim-cmp source
			'saadparwaiz1/cmp_luasnip', -- Snippet Engine & its associated nvim-cmp source
			'hrsh7th/cmp-nvim-lsp', -- Adds LSP completion capabilities
			'rafamadriz/friendly-snippets', -- Adds a number of user-friendly snippets
		},
	},
	{ 'mg979/vim-visual-multi', lazy = false },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 600
		end,
		opts = {
			icons = {
				separator = "",
				group = ""
			}
		}
	},
	{ 'lewis6991/gitsigns.nvim' },
	{ 'numToStr/Comment.nvim',  opts = {}}, -- 'gc' to comment visual regions/lines
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		-- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		'nvim-treesitter/nvim-treesitter-context',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		build = ':TSUpdate',
	},
	{ 'kylechui/nvim-surround',         opts = {}, event = 'VeryLazy' },
	{ 'NvChad/nvim-colorizer.lua' },
	-- debugging...
	{ 'mfussenegger/nvim-dap' },
	{ 'rcarriga/nvim-dap-ui' },
	-- { 'jay-babu/mason-nvim-dap.nvim' },
	{ 'theHamsta/nvim-dap-virtual-text' }

})

--
require('colorizer').setup({
	user_default_options = {
		css = true,
		css_fn = true,
	},
})

require('gitsigns').setup {}

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
--
-- [[ Configure nvim-cmp ]] -- See `:help cmp`
require('telescope').setup { -- Telescope -- See `:help telescope` and `:help telescope.setup()`
	defaults = {
		file_ignore_patterns = { "node_modules" },
		layout_config = { width = .99 },
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
			},
		},
	},
}

pcall(require('telescope').load_extension, 'fzf') -- Enable telescope fzf native, if installed

require('nvim-treesitter.configs').setup {
	modules = {},
	sync_install = false,
	ignore_install = {},
	ensure_installed = {
		'astro', 'c', 'css', 'cpp', 'gitignore', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'jsdoc', 'php', 'scss', 'sql', 'typescript', 'vimdoc', 'vim', 'vue'
	},
	auto_install = true, -- default: false, (auto installs languages)
	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<c-space>',
			node_incremental = '<c-space>',
			scope_incremental = '<c-i>',
			node_decremental = '<M-space>',
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				['aa'] = '@parameter.outer',
				['ia'] = '@parameter.inner',
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
			},
		},
		swap = {
			enable = true,
			swap_next = {
				['<leader>a'] = '@parameter.inner',
			},
			swap_previous = {
				['<leader>A'] = '@parameter.inner',
			},
		},
	},
}

-- [[ Configure LSP ]]
local on_attach = function(_, bufnr)     -- run when LSP connects to particular buffer
	-- Function that lets us more easily define mappings specific for LSP related items.
	local nmap = function(keys, func, desc) -- sets the mode, buffer and description each time.
		if desc then
			desc = 'LSP: ' .. desc
		end
		k.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
	nmap('<leader>lc', vim.lsp.buf.code_action, '[C]ode [A]ction')

	nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
	nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')


	nmap('<leader>lD', vim.lsp.buf.type_definition, 'Type [D]efinition')
	nmap('<leader>lr', ':LspRestart<CR>', 'Restart Lsp servers')

	nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

	-- Lesser used LSP functionality
	nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	nmap('<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[W]orkspace [L]ist Folders')

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		print('Start formatting...')
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })
end

-- See `:help telescope.builtin`
local bi = require('telescope.builtin')
k.set('n', '<leader>tr', bi.oldfiles, { desc = '[R]ecently opened' })
k.set('n', '<leader>tb', bi.buffers, { desc = '[B]uffers' })
k.set('n', '<leader>tf', bi.find_files, { desc = '[F]ile picker' })
k.set('n', '<leader>th', bi.help_tags, { desc = '[H]elps' })
k.set('n', '<leader>tw', bi.grep_string, { desc = 'current [W]ords' })
k.set('n', '<leader>t/', bi.live_grep, { desc = '[G]reps / Global search' })
k.set('n', '<leader>td', bi.diagnostics, { desc = '[D]iagnostics' })
k.set('n', '<leader>tg', bi.git_files, { desc = '[G]it [F]iles' })
k.set('n', '<leader>tm', ':Telescope keymaps<Return>', { desc = '[M]aps' })

-- Diagnostic keymaps
k.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
k.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
k.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
k.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


require('lspconfig').astro.setup {}


-- language servers
local servers = {
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = "Disable" },
			telemetry = { enable = false }
		}
	},
}

--
require('neodev').setup({
	-- library = { plugins = { "nvim-dap-ui" }, types = true }
	library = { plugins = { "nvim-dap-ui" } }
})

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
	ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
	function(server_name)
		require('lspconfig')[server_name].setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
			filetypes = (servers[server_name] or {}).filetypes,
		}
	end
}

require('lspconfig').volar.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	--	filetypes= {'vue','javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx'} -- runs as duplicate next to tsserver in vanilla js, need to decide which of the two (volar or tsserver) is dead weight
	filetypes = { 'vue' }
}

local cmp = require 'cmp'
local luasnip = require 'luasnip'
luasnip.filetype_extend("typescript", { "javascript" })
luasnip.filetype_extend("javascript", { "jsdoc" })
luasnip.filetype_extend("vue", { "jsdoc" })
luasnip.filetype_extend("html", { "vue", "astro" })
require('luasnip.loaders.from_vscode').lazy_load()

luasnip.config.setup {}

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert {
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-1),
		['<C-f>'] = cmp.mapping.scroll_docs(7),
		['<C-Space>'] = cmp.mapping.complete {},
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(2) then
				luasnip.jump(2)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
}

-- which-key grouped names
local wk = require('which-key')
wk.register({
	-- c = { name = "LSP [C]ode" },
	d = { name = "DAP" },
	f = { name = "Formatting" },
	g = { name = "Git" },
	l = "LSP misc",
	r = "Replace / Rename",
	t = { name = "Telescope" },
	w = "Workspace",
}, { prefix = "<leader>" })

-- debugging

-- require('mason-nvim-dap').setup {
-- 	ensure_installed = { 'node2', 'js', 'chrome' }
-- }

require('nvim-dap-virtual-text').setup()

local dap_ok, dap = pcall(require, "dap")
local dap_ui_ok, dapui = pcall(require, "dapui")

if not (dap_ok and dap_ui_ok) then
	print("nvim-dap or dap-ui not installed")
	return
end

dapui.setup({
	-- had some custom controls, also very nice... using icons for now, for this to work with Iosevka, the font Iosevka Nerd Font Mono needs to be used.	
	-- controls = {
	-- 	enabled = true,
	-- 	icons = {
	-- 		play = "▶️ ",
	-- 		step_into = "⇓ ",
	-- 		step_over = "⇒ ",
	-- 		step_out = "⇑ ",
	-- 		step_back = "⇐ ",
	-- 		run_last = "↺ ",
	-- 		terminate = "⏹️ ",
	-- 		disconnect = "❌",
	-- 		pause = "⏸️ "
	-- 	}
	-- },
	-- icons = {
	-- 	expanded = "▾ ",
	-- 	collapsed = "▸ ",
	-- },
	layouts = { {
		elements = {
			{
				id = "scopes",
				size = 0.7
			},
			{
				id = "watches",
				size = 0.3
			}
		},
		position = "right",
		size = 40
	}, {
		elements = {
			{
				id = "console",
				size = 1
			} },
		position = "bottom",
		size = 6
	} },
})

require('dap').set_log_level('INFO') -- Helps when configuring DAP, see logs with :DapShowLog
dap.configurations = {
	javascript = {
		{
			type = 'node2',
			name = 'Launch',
			request = 'launch',
			program = '${file}',
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = 'inspector',
			console = 'integratedTerminal',
		},
	}
}
dap.adapters.node2 = {
	type = 'executable',
	command = 'node',
	args = { vim.fn.stdpath("data") .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
}
k.set('n', '<leader>do', function() dapui.toggle() end, { desc = 'Open/close toggle' })
k.set('n', '<leader>dt', ':DapTerminate<CR>', { desc = 'Terminate session' })
k.set('n', '<F5>', function() dap.continue() end, { desc = 'Continue' })
k.set('n', '<F6>', function() dap.step_over() end, { desc = 'Step over' })
k.set('n', '<F7>', function() dap.step_into() end, { desc = 'Step into' })
k.set('n', '<F8>', function() dap.step_out() end, { desc = 'Step out' })
k.set('n', '<Leader>db', function() dap.toggle_breakpoint() end, { desc = 'Toggle breakpoint' })
k.set('n', '<Leader>dB', function() dap.set_breakpoint() end, { desc = 'Set Breakpoint' })
k.set('n', '<Leader>dm', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
	{ desc = 'set breakpoint ...' })
k.set('n', '<Leader>dr', function() dap.repl.toggle() end, { desc = 'repl open' })
k.set('n', '<Leader>dl', function() dap.run_last() end, { desc = 'Run Last' })
k.set({ 'n', 'v' }, '<Leader>dh', function() require('dap.ui.widgets').hover() end, { desc = 'UI widgets hover' })
k.set({ 'n', 'v' }, '<Leader>dp', function() require('dap.ui.widgets').preview() end, { desc = 'UI widgets preview' })
k.set('n', '<Leader>df', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.frames)
end, { desc = 'UI widgets frames' })
k.set('n', '<Leader>ds', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.scopes)
end, { desc = 'UI widgets scopes' })
-- Close debugger and clear breakpoints
k.set("n", "<Leader>dx", function()
	dap.clear_breakpoints()
	dapui.toggle({})
	dap.terminate()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
end, { desc = "Clear session, breakpoints & exit debugger" })
