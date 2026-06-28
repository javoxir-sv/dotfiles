return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter').install {
			'rust',
			'javascript',
			'python',
			'lua',
			'css',
			'bash',
			'cmake',
			'c',
			'c_sharp',
			'cpp',
			'csv',
			'dockerfile',
			'htmldjango',
			'html',
			'json',
			'make',
			'nginx',
			'regex',
			'sql',
			'yaml',
			'markdown',
			'vim',
			'vimdoc',
			'query',
		}
		vim.api.nvim_create_autocmd('FileType', {
			pattern = { '<filetype>' },
			callback = function() vim.treesitter.start() end,
		})
	end
}
