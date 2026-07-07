return {
	"sanzharkuandyk/nagisa.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nagisa").setup({
			italic_comments = true,
		})
		vim.cmd.colorscheme("EndOfTheWorld")
	end,
}
