vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking",
	group = vim.api.nvim_create_augroup("highlight-on-yank", { clear = true }),
	callback = function() vim.hl.on_yank() end,
})


-- Expand visual selection to parent Tree-sitter node with <CR>
vim.keymap.set({ 'n', 'x' }, '<CR>', function()
	-- If not in visual mode, enter visual character mode first
	if vim.fn.mode() ~= 'v' and vim.fn.mode() ~= 'V' then
		vim.cmd('normal! v')
	end

	-- Select the parent node
	local node = vim.treesitter.get_node()
	if node then
		local parent = node:parent()
		if parent then
			local start_row, start_col, end_row, end_col = parent:range()
			vim.fn.setpos("'<", { 0, start_row + 1, start_col + 1, 0 })
			vim.fn.setpos("'>", { 0, end_row + 1, end_col, 0 })
			vim.cmd('normal! gv')
		end
	end
end, { desc = 'Expand Treesitter node selection' })
