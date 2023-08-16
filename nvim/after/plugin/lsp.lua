local lsp = require('lsp-zero').preset({})

-- .ensure_installed() will be removed. Use the module mason-lspconfig to install LSP servers
-- TODO: refactor into Mason code
lsp.ensure_installed({
	'tsserver',
	'eslint',
	'rust_analyzer',
	-- 'stylelint'
})




lsp.on_attach(function(client, bufnr)
	print('lsp.on_attach loaded')
	-- :help lsp-zero-keybindings
	lsp.default_keymaps({ buffer = bufnr })
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		['lua_ls'] = { 'lua' },
		['rust_analyzer'] = { 'rust' },
		['astro-language-server'] = { 'astro' },
		['vue-language-server'] = { 'vue' },
		['typescript-language-server'] = { 'typescript', 'tsx', 'typescriptreact' }, -- TODO: seems to work... not fully though
		['eslint-lsp'] = { 'typescript', 'tsx', 'typescriptreact' }, -- TODO: is (mostly?) ignored
		['prettier'] = { 'typescript', 'tsx', 'typescriptreact', 'html', 'css' }, -- TODO: is (mostly?) ignored
		['stylelint-lsp'] = { 'css' } -- TODO: doesnt seem to work
	}
})

lsp.setup() -- .setup() will be removed -- TODO: what will be the replacement?
