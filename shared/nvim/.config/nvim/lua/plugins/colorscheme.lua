-- return {
-- 	"dark-orchid/neovim",
-- 	main = "dark-orchid",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- }
--

-- return {
-- 	'sainnhe/sonokai',
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.sonokai_enable_italic = false
-- 		vim.g.sonokai_disable_italic = true
-- 		vim.g.sonokai_disable_italic_comment = true
-- 		vim.g.sonokai_style = 'default'
-- 		vim.cmd.colorscheme('sonokai')
-- 	end
-- }

-- return {
-- 	"zitrocode/carvion.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require('carvion').setup({
-- 			styles = {
-- 				comments = { italic = false },
-- 				functions = { italic = false },
-- 			}
-- 		})
-- 		vim.cmd.colorscheme('carvion')
-- 	end
-- }

-- return {}
--


return {
	'datsfilipe/vesper.nvim',
	lazy = false,
	priority = 1000,
	config = function()
		require('vesper').setup({
			transparent = false, -- Boolean: Sets the background to transparent
			italics = {
				comments = false, -- Boolean: Italicizes comments
				keywords = false, -- Boolean: Italicizes keywords
				functions = false, -- Boolean: Italicizes functions
				strings = false, -- Boolean: Italicizes strings
				variables = false, -- Boolean: Italicizes variables
			},
			overrides = {},   -- A dictionary of group names, can be a function returning a dictionary or a table.
			palette_overrides = {}
		})
		vim.cmd.colorscheme('vesper')
	end
}
