local km = vim.keymap
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
	-- 'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically, idk if this is useful

	{
		-- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{
				'williamboman/mason.nvim',
				config = true,
				opts = { ensure_installed = { 'html-lsp', 'prettier', 'tsserver', 'vue-language-server', 'css-lsp' } }
			},
			'williamboman/mason-lspconfig.nvim',
			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ 'j-hui/fidget.nvim', tag = 'legacy', opts = {} }, -- not sure if this is actually that helpful, keep it lean..
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

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 600
		end,
		opts = {}
	},

	{ 'lewis6991/gitsigns.nvim' },

	{ 'Shatur/neovim-ayu' },
	{
		'nvim-lualine/lualine.nvim',
		opts = {
			options = {
				component_separators = '',
				section_separators = '',
				path = 1,
				shorting_target = 70,
				theme = 'ayu'
			},
			sections = {
				lualine_a = {
					{ 'mode', fmt = function(res) return res:sub(1, 3) end } -- only use first 3 letters of modes, ex: NORMAL -> NOR, INSERT -> INS, etc.
				},
			},
		},
	},

	{ 'numToStr/Comment.nvim',         opts = {}, lazy = false }, -- 'gc' to comment visual regions/lines

	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make',
				cond = function()
					return vim.fn.executable 'make' == 4
				end,
			},
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

		require 'ck.plugins.autoformat', -- autoformat plugins
		require 'ck.plugins.debug', -- debugging plugins

		{ 'nvim-tree/nvim-web-devicons', event = 'VeryLazy' },
		{
			'nvim-neo-tree/neo-tree.nvim',
			branch = 'v3.x',
			dependencies = {
				'nvim-lua/plenary.nvim',
				-- 'nvim-tree/nvim-web-devicons', -- commented because already lazy loaded via nvim-tree/nvim-web-devicons
				'MunifTanjim/nui.nvim',
			}
		},
	},

	{ 'simrat39/symbols-outline.nvim', opts = {}, },

	{
		'kylechui/nvim-surround',
		opts = {},
		event = 'VeryLazy'
	},

	{ 'NvChad/nvim-colorizer.lua', event = 'VeryLazy' },

	-- { 'mfussenegger/nvim-dap' },
	-- { 'rcarriga/nvim-dap-ui' }
})

--
require('ayu').setup({
	mirage = false,
	overrides = {
		CursorLine = { bg = "#232333" },
		WhichKeyFloat = { bg = "#2c2c2c" },
		-- CursorColumn = { fg = "#ff0000", bg = "#00ff00" }
	}
})
require('ayu').colorscheme()
vim.cmd('colorscheme ayu-dark')
-- vim.cmd('hi Normal guibg=#000000')
vim.cmd('hi visual guibg=#2f2f3f')

require('colorizer').setup {
	filetypes = { 'css', 'html', 'tsx' },
	user_default_options = {
		css = true,
		css_fn = true,
		tailwind = true,
		sass = { enable = true, parsers = { "css" }, },
	},
}

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
--
-- [[ Configure nvim-cmp ]] -- See `:help cmp`
require('telescope').setup { -- Telescope -- See `:help telescope` and `:help telescope.setup()`
	defaults = {
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
-- See `:help telescope.builtin` , see remap file for key bindings

-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
	modules = {},
	sync_install = false,
	ignore_install = {},
	ensure_installed = {
		'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'jsdoc', 'typescript', 'vimdoc', 'vim', 'vue'
	},
	auto_install = true, -- default: false, (auto installs languages)
	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<c-space>',
			node_incremental = '<c-space>',
			scope_incremental = '<c-s>',
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
		km.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
	nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

	nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
	nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
	nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
	nmap('<leader>tsd', require('telescope.builtin').lsp_document_symbols, '[S]ymbols in [D]ocument')
	nmap('<leader>tsw', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[S]ymbols in [W]orkspace')

	nmap('K', vim.lsp.buf.hover, 'Hover Documentation') -- See `:help K` for why this keymap

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
km.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer' })

km.set('n', '<leader>tr', bi.oldfiles, { desc = '[R]ecently opened' })
km.set('n', '<leader>tb', bi.buffers, { desc = '[B]uffers' })

km.set('n', '<leader>tf', bi.find_files, { desc = '[F]iles' })
km.set('n', '<leader>th', bi.help_tags, { desc = '[H]elps' })
km.set('n', '<leader>tw', bi.grep_string, { desc = 'current [W]ords' })
km.set('n', '<leader>tgr', bi.live_grep, { desc = '[G]reps' })
km.set('n', '<leader>td', bi.diagnostics, { desc = '[D]iagnostics' })
km.set('n', '<leader>tgf', bi.git_files, { desc = '[G]it [F]iles' })

km.set('n', '<leader>tm', ':Telescope keymaps<Return>', { desc = '[M]aps' })

-- Diagnostic keymaps
km.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
km.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
km.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
km.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Enable the following language servers
--  add/remove any LSPs. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config.
--
--  override default filetypes your language server will attach to, define property 'filetypes' to the map in question.
local servers = {
	-- tsserver = { 'typescript', 'tsx', 'typescriptreact', 'jsdoc' },
	-- html = { filetypes = { 'html', 'twig', 'hbs', 'php' } },
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
	-- --	eslint = { 'typescript', 'tsx', 'typescriptreact' }, -- TODO: is (mostly?) ignored
}
-- Setup neovim lua configuration
require('neodev').setup({
	--	library = { plugins = { "nvim-dap-ui" }, types = true },
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

local cmp = require 'cmp'
local luasnip = require 'luasnip'
luasnip.filetype_extend("typescript", { "javascript" })
luasnip.filetype_extend("javascript", { "jsdoc" })
luasnip.filetype_extend("html", { "vue" })
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
local wk = require("which-key")
wk.register({
	c = { name = "+ LSP [C]ode" },
	f = { name = "+ Formatting" },
	r = { name = "+ Replace / Rename" },
	t = { name = "+ Telescope" },
	w = { name = "+ Workspace" }
}, { prefix = "<leader>" })