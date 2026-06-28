return {
	'stevearc/oil.nvim',
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		keymaps = {
			["tn"] = {
				desc = "Toggle file detail view",
				callback = function()
					require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
					require('oil').toggle_hidden()
				end,
			},
			["tf"] = {
				desc = "Toggle off file detail view",
				callback = function()
					require("oil").set_columns({ "icon" })
				end,
			},
		},
		vim.keymap.set('n', '<leader>o', '<cmd>Oil<cr>', { desc = 'Opens the Oil window for the project directory' }),
	},
	dependencies = {
		{ "nvim-mini/mini.icons",    opts = {} },
		{ "benomahony/oil-git.nvim", opts = {} },
	},
	lazy = false,
}
