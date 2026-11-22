-- Leader key must be set before lazy is loaded
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Core configuration
require("config.options")
require("config.keymaps")
require("config.lazy")
require("config.autocmds")
