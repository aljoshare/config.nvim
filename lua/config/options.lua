local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true

-- Search behavior
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Appearance & UI
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.fillchars = { eob = " " }

-- Splits
opt.splitright = true
opt.splitbelow = true
opt.splitkeep = "screen"

-- Performance & Behavior
opt.updatetime = 250
opt.timeoutlen = 300
opt.swapfile = false
opt.backup = false
opt.undofile = true -- Persistent undo across sessions

-- Mouse & Clipboard (works across Linux & macOS)
opt.mouse = "a"
opt.clipboard = "unnamedplus"

-- Disable netrw in favor of oil.nvim
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
