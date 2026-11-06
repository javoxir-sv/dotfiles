--[[ return {
	"sanzharkuandyk/nagisa.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nagisa").setup({
			italic_comments = true,
		})
		vim.cmd.colorscheme("EndOfTheWorld")
	end,
} ]]

return {
	"thekylehuang/cole.nvim",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("cole")
	end,
}
