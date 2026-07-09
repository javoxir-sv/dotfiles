vim.keymap.set("n", "<leader>w", "<cmd>silent! write<cr>", { desc = "Save file" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Stop highlighting when pressed Esc" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down in insert mode" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up in insert mode" })
vim.keymap.set({ 'n', 'x' }, '<C-a>', 'ggVG', { desc = "Selecting all" })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = "Esc to exit terminal mode" })
vim.keymap.set('n', '<M-j>', '<cmd>cnext<cr>', { desc = 'Go to next line | Quickfix' })
vim.keymap.set('n', '<M-k>', '<cmd>cprev<cr>', { desc = 'Go to previous line | Quickfix' })
vim.keymap.set('i', "<M-h>", "<Left>", { desc = "Move the cursor to the left. Motions, but in insert mode" })
vim.keymap.set('i', "<M-l>", "<Right>", { desc = "Move the cursor to the right. Motions, but in insert mode" })


-- yank related
vim.keymap.set({ "n", "x" }, "x", '"_x', { desc = "Don't let the char-delete touch the YANK!" })
vim.keymap.set({ "n", "x" }, "X", '"_d', { desc = "Don't let the char-delete touch the YANK!" })
vim.keymap.set({ "n", "x" }, "c", '"_c', { desc = "Don't let the char-delete touch the YANK!" })
vim.keymap.set({ "n", "x" }, "D", '"_D', { desc = "Don't let the char-delete touch the YANK!" })
vim.keymap.set({ "n", "x" }, "d", '"_d', { desc = "Don't let the char-delete touch the YANK!" })
