--Global
vim.g.mapleader = " "
vim.g.maplocalleader = " "


--Options
require("config.options")

--Keymaps
require("config.keymaps")

--lazy.nvim
require("config.lazy")

--LSP
require("config.lsp")

--Scripts
require("config.scripts")
