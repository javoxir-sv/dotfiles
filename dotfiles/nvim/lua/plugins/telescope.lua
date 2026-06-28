return {
	'nvim-telescope/telescope.nvim',
	version = '*',
	event = 'VimEnter',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	config = function()
		local actions = require "telescope.actions"
		require('telescope').setup {
			extensions = {
				fzf = {}
			},
			defaults = {
				initial_mode = "normal",
				border = false,
			},
			pickers = {
				current_buffer_fuzzy_find = {
					initial_mode = "insert",
				},
				find_files = {
					initial_mode = "insert",
				},
				live_grep = {
					initial_mode = 'insert',
				},
				git_files = {
					initial_mode = 'insert'
				},
				buffers = {
					mappings = {
						i = {
							["<C-d>"] = actions.delete_buffer + actions.move_to_top,
							["dd"] = actions.delete_buffer + actions.move_to_top,

						},
						n = {
							["<C-d>"] = actions.delete_buffer + actions.move_to_top,
							["dd"] = actions.delete_buffer + actions.move_to_top,
						},
					}
				},
			}
		}

		--Autosave when Telescope opens
		local save_group = vim.api.nvim_create_augroup('Autosave', { clear = true })
		vim.api.nvim_create_autocmd('User', {
			group = save_group,
			pattern = 'TelescopeFindPre',
			callback = function()
				--vim.cmd('silent! write')
			end
		})


		-- Harpoon
		local harpoon = require('harpoon')
		harpoon:setup({})
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			local make_finder = function()
				local paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(paths, item.value)
				end
				return require("telescope.finders").new_table({
					results = paths,
				})
			end

			require("telescope.pickers").new({}, {
				prompt_title = "Harpoon",
				finder = require("telescope.finders").new_table({
					results = file_paths,
				}),
				previewer = conf.file_previewer({}),
				sorter = conf.generic_sorter({}),
				attach_mappings = function(prompt_buffer_number, map)
					map({ 'n', 'i' }, "<c-d>", function()
						local state = require("telescope.actions.state")
						local selected_entry = state.get_selected_entry()
						local current_picker = state.get_current_picker(prompt_buffer_number)

						harpoon:list():remove(selected_entry)
						current_picker:refresh(make_finder())
					end)

					return true
				end,
			}):find()
		end

		-- Key binds
		local builtin = require 'telescope.builtin'
		-- [F]ind prefix
		vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
		vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[F]ind [S]elect Telescope' })
		vim.keymap.set({ 'n', 'v' }, '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
		vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = '[F]ind [G]it files' })
		vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
		vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
		vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
		vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = '[F]ind [C]ommands' })
		vim.keymap.set("n", "<leader>fh", function() toggle_telescope(harpoon:list()) end,
			{ desc = "Open harpoon window | a.k.a [F]ind [H]arpoon" })
		-- No prefix
		vim.keymap.set('n', '<leader>r', builtin.registers, { desc = 'Registers. Pastes the content on <CR>' })
		vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
		vim.keymap.set('n', '<leader>.', builtin.live_grep, { desc = 'Find by grep | Whole directory' })
		vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find,
			{ desc = "Fuzzy Live search inside of the currently open buffer" })
		vim.keymap.set('n', '<leader>t', builtin.treesitter,
			{ desc = 'Lists Function names, variables, ... using treesitter locals queries' })
		-- LSP
		vim.keymap.set({ 'n', 'v' }, '<leader>r', builtin.lsp_references,
			{ desc = 'Lists LSP references for word under the cursor' })
		vim.keymap.set({ 'n', 'v' }, '<leader>i', builtin.lsp_implementations,
			{ desc = "Goto the implementation of the word under the cursor" })
		vim.keymap.set({ 'n', 'v' }, '<leader>d', builtin.lsp_definitions,
			{ desc = "Goto the definition of the word under the cursor" })
		-- [G]it prefix
		vim.keymap.set('n', '<leader>gc', builtin.git_commits,
			{ desc = "Git commits, checkout action <cr>, reset mixed <C-r>m, reset soft <C-r>s and reset hard <C-r>h" })
		vim.keymap.set('n', '<leader>gb', builtin.git_branches,
			{
				desc =
				"Lists branches, checkout action <cr>, track action <C-t>, rebase action<C-r>, create action <C-a>, switch action <C-s>, delete action <C-d> and merge action <C-y>"
			})
		vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = "Lists chanes, (Multi-selection still WIP)" })
	end,
}
