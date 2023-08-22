-- autoformat.lua
-- Use your language server to automatically format your code on save.
-- Adds additional commands as well to manage the behavior

return {
  'neovim/nvim-lspconfig',
  config = function()
    -- Switch for controlling whether you want autoformatting.
    --  Use :KickstartFormatToggle to toggle autoformatting on or off
    local format_is_enabled = true
    vim.api.nvim_create_user_command('KickstartFormatToggle', function()
      format_is_enabled = not format_is_enabled
      print('Setting autoformatting to: ' .. tostring(format_is_enabled))
    end, {})

    -- Create an augroup that is used for managing our formatting autocmds.
    --      We need one augroup per client to make sure that multiple clients
    --      can attach to the same buffer without interfering with each other.
    local _augroups = {}
    local get_augroup = function(client)
      if not _augroups[client.id] then
        local group_name = 'kickstart-lsp-format-' .. client.name
        local id = vim.api.nvim_create_augroup(group_name, { clear = true })
        _augroups[client.id] = id
      end

      return _augroups[client.id]
    end

    -- Whenever an LSP attaches to a buffer, we will run this function.
    --
    -- See `:help LspAttach` for more information about this autocmd event.
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach-format', { clear = true }),
      -- This is where we attach the autoformatting for reasonable clients
      callback = function(args)
        local client_id = args.data.client_id
        local client = vim.lsp.get_client_by_id(client_id)
        local bufnr = args.buf

        -- Only attach to clients that support document formatting
        if not client.server_capabilities.documentFormattingProvider then
          return
        end

        -- if client.name == 'tsserver' then
        --   return
        -- end

        -- Create an autocmd that will run *before* we save the buffer.
        --  Run the formatting command for the LSP that has just attached.
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = get_augroup(client),
          buffer = bufnr,
          callback = function()
            if not format_is_enabled then
              return
            end

            vim.lsp.buf.format {
              -- async = true, -- TODO: dit was true, standaard waarde en nut hiervan achterhalen
              async = false,
              --              timeout_ms = 10000,
              filter = function(c)
                return c.id == client.id
              end,
            }
          end,
        })
      end,
    })
  end,
}

-- TODO: stuff below needs te be implemented somewhere

-- local lsp = require('lsp-zero').preset({})
--
-- -- .ensure_installed() will be removed. Use the module mason-lspconfig to install LSP servers
-- -- TODO: refactor into Mason code
-- lsp.ensure_installed({
-- 	'tsserver',
-- 	'eslint',
-- 	'rust_analyzer',
-- 	-- 'stylelint'
-- })
--
--
-- lsp.on_attach(function(client, bufnr)
-- 	print('lsp.on_attach loaded')
-- 	-- :help lsp-zero-keybindings
-- 	lsp.default_keymaps({ buffer = bufnr })
-- end)
--
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
--
-- lsp.format_on_save({
-- 	format_opts = {
-- 		async = false,
-- 		timeout_ms = 10000,
-- 	},
-- 	servers = {
-- 		['lua_ls'] = { 'lua' },
-- 		['rust_analyzer'] = { 'rust' },
-- 		['astro-language-server'] = { 'astro' },
-- 		['vue-language-server'] = { 'vue' },
-- 	['typescript-language-server'] = { 'typescript', 'tsx', 'typescriptreact' }, -- TODO: seems to work... not fully though
-- 		['eslint-lsp'] = { 'typescript', 'tsx', 'typescriptreact' }, -- TODO: is (mostly?) ignored
-- 		['prettier'] = { 'typescript', 'tsx', 'typescriptreact', 'html', 'css' }, -- TODO: is (mostly?) ignored
-- 		['stylelint-lsp'] = { 'css' } -- TODO: doesnt seem to work
-- 	}
-- })
--
-- lsp.setup() -- .setup() will be removed -- TODO: what will be the replacement?
