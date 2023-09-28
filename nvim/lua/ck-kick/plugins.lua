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
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',
	'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

	{
		-- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ 'williamboman/mason.nvim', config = true,  opts = { ensure_installed = { "html-lsp", "prettier" } } },
			'williamboman/mason-lspconfig.nvim',
			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },
			'folke/neodev.nvim', -- Additional lua configuration, makes nvim stuff amazing!
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

	-- Useful plugin to show pending keybinds.
	{ 'folke/which-key.nvim',  opts = {} },
	{
		-- Adds git related signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
			on_attach = function(bufnr)
				km.set('n', '<leader>gp', require('gitsigns').prev_hunk,
					{ buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
				km.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
				km.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
			end,
		},
	},

	{
		'nvim-lualine/lualine.nvim',
		opts = {
			options = {
				icons_enabled = true,
				component_separators = '|',
				section_separators = '',
				path = 1,
				shorting_target = 70,
				file_status = false,
			},
			sections = {
				lualine_a = {
					{ 'mode', fmt = function(res) return res:sub(1, 3) end } },
			},
		},
	},

	{ 'numToStr/Comment.nvim', opts = {} }, -- "gc" to comment visual regions/lines

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

		-- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
		--       These are some example plugins that I've included in the kickstart repository.
		--       Uncomment any of the lines below to enable them.
		require 'kickstart.plugins.autoformat',
		-- require 'kickstart.plugins.debug',

		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
			}
		},
		-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
		--    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
		--    up-to-date with whatever is in the kickstart repo.
		--    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
		--
		--    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
		-- { import = 'custom.plugins' },
	}, })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
--
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
	ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim' }, -- Add languages to be installed here that you want installed for treesitter


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
	nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

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

km.set('n', '<leader>sr', bi.oldfiles, { desc = '[S]earch [R]ecently opened files' })
km.set('n', '<leader>sb', bi.buffers, { desc = '[S]earch current [B]uffers' })

km.set('n', '<leader>sf', bi.find_files, { desc = '[S]earch [F]iles' })
km.set('n', '<leader>sh', bi.help_tags, { desc = '[S]earch [H]elp' })
km.set('n', '<leader>sw', bi.grep_string, { desc = '[S]earch current [W]ord' })
km.set('n', '<leader>sg', bi.live_grep, { desc = '[S]earch [G]rep' })
km.set('n', '<leader>sd', bi.diagnostics, { desc = '[S]earch [D]iagnostics' })
km.set('n', '<leader>gf', bi.git_files, { desc = 'Search [G]it [F]iles' })

km.set('n', '<leader>sm', ':Telescope keymaps<Return>', { desc = '[S]how [M]aps' })

-- Diagnostic keymaps
km.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
km.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
km.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
km.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
	-- clangd = {},
	-- gopls = {},
	-- pyright = {},
	-- rust_analyzer = {},
	tsserver = { 'typescript', 'tsx', 'typescriptreact' },
	html = { filetypes = { 'html', 'twig', 'hbs', 'php' } },
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
	eslint = { 'typescript', 'tsx', 'typescriptreact' }, -- TODO: is (mostly?) ignored
}
-- Setup neovim lua configuration
require('neodev').setup()

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

-- [[ Configure nvim-cmp ]] -- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
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