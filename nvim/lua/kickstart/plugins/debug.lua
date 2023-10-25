-- debug.lua
--  Use DAP to debug.

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		'williamboman/mason.nvim',
		'jay-babu/mason-nvim-dap.nvim',
		"rcarriga/nvim-dap-ui",

		-- own debuggers
		-- 'leoluz/nvim-dap-go' -- activate line when decided to use nvim-dap-go
	},
	config = function()
		local dap = require 'dap'
		local dapui = require 'dapui'

		require('mason-nvim-dap').setup {
			-- Make best effort to setup the various debuggers with
			-- reasonable debug configurations
			automatic_setup = true,
			ensure_installed = { 'node2,firefox,chrome' },
			-- ensure_installed = { 'node2,firefox,chrome,delve' }, -- activate line when decided to use nvim-dap-go
			handlers = {}, -- provide additional configuation to handlers, see mason-nvim-dap README
		}

		vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
		vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
		vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
		vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
		vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
		vim.keymap.set('n', '<leader>B', function()
			dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
		end, { desc = 'Debug: Set Breakpoint' })
		vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

		dapui.setup()

		-- dap.listeners.after.event_initialized['dapui_config'] = dapui.open

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open({ reset = true })
			print('dap listeners after event event_initialized dapui_config...');
		end
		dap.listeners.before.event_terminated['dapui_config'] = dapui.close
		dap.listeners.before.event_exited['dapui_config'] = dapui.close

		-- Install golang specific config
		-- require('dap-go').setup()-- activate line when decided to use nvim-dap-go
	end
}
