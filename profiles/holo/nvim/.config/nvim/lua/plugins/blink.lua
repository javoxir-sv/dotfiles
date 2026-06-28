return {
	'saghen/blink.cmp',
	event = "VimEnter",
	dependencies = {
		{ 'rafamadriz/friendly-snippets' },
		{ 'saghen/blink.cmp' },
		{
			'L3MON4D3/LuaSnip',
			version = '2.*',
			build = (function()
				if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then return end
				return 'make install_jsregexp'
			end)(),
		},
	},

	version = '1.*',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = 'default',
			['<Up>'] = { 'fallback' },
			['<Down>'] = { 'fallback' },
			['<C-j>'] = { 'select_next', 'fallback' },
			['<C-k>'] = { 'select_prev', 'fallback' },
			['<C-space>'] = { 'show', 'hide' },
			['<C-cr>'] = { 'accept', 'fallback' },
			['<S-Tab>'] = { 'snippet_backward', 'fallback' },
			['<C-p>'] = { 'show_signature', 'hide_signature', 'fallback' },
			['<C-q>'] = { 'show_documentation', 'hide_documentation', 'fallback' },
			['<Tab>'] = {
				function(cmp)
					if cmp.snippet_active() then
						return cmp.accept()
					else
						return cmp.select_and_accept()
					end
				end,
				'snippet_forward',
				'fallback'
			},
		},

		appearance = {
			nerd_font_variant = 'mono'
		},

		completion = {
			menu = { auto_show = true },
			documentation = {
				auto_show = false,
				auto_show_delay_ms = 50,
			},
			keyword = { range = 'full' },
		},

		signature = { enabled = false },
		snippets = { preset = 'luasnip' },

		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" }
	},
	opts_extend = { "sources.default" }
}
