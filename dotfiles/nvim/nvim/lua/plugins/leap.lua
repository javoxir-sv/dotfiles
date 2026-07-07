return {
	"https://codeberg.org/andyg/leap.nvim",
	lazy = false,
	config = function()
		-- leap.nvim
		vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
		vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')

		vim.keymap.set({ 'x', 'o' }, 'an', function()
			require('leap.treesitter').select {
				opts = require('leap.user').with_traversal_keys('n', 'N')
			}
		end)
	end,
}
