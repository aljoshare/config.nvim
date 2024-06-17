-- Bootstrap Package Manager --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local plugins = require("config.plugins")
require("lazy").setup(plugins)
-- End --

-- UI --
require("config.ui.catppuccin")
require("config.ui.lualine")
require("config.ui.barbecue")
require("config.ui.alpha")
-- --

-- LSP --
require("config.lsp.mason")
require("config.lsp.lspconfig")
-- --

-- IDE --
require("config.ide.conform")
require("config.ide.ray-x")
require("config.ide.treesitter")
require("config.ide.gitblame")
require("config.ide.dap")
require("config.ide.dapui")
-- --

-- Navigation --
require("config.navigation.harpoon")
require("config.navigation.nvim-tree")
require("config.navigation.cinnamon")
-- --

require("config.options")
require("config.mappings")
require("config.autocmds")
