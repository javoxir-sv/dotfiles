return {
	"neovim/nvim-lspconfig",
	dependencies = { 'saghen/blink.cmp' },
	lazy = false,
	config = function()
		vim.lsp.autocompletion = true
	end,
}
