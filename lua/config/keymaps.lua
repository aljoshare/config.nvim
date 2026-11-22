local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Clear search highlight on pressing <Esc> in normal mode
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- Quick save
keymap({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize window using <ctrl> arrow keys
keymap("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Move lines up/down in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Keep cursor centered during half-page jumps & search next
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Stay in indent mode when indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Paste over selection without replacing clipboard with deleted text
keymap("x", "<leader>p", [["_dP]], { desc = "Paste without replacing register" })

-- Diagnostic navigation
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
keymap("n", "<leader>e", vim.diagnostic.open_float, { desc = "Line diagnostics" })
keymap("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Quickfix list diagnostics" })
