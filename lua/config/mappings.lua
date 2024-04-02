local function map(mode, lhs, rhs, opts)
  -- set default value if not specify
  if opts.noremap == nil then
    opts.noremap = true
  end
  if opts.silent == nil then
    opts.silent = true
  end

  vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>:w<CR>", {
  desc = "Save File",
})

-- nvim-spectre --
vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
  desc = "Toggle Spectre",
})
vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "Search current word",
})
vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word",
})
vim.keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file",
})

-- --

-- Telescope --
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
-- --

-- NeoTree --
vim.keymap.set("n", "<C-n>", "<Cmd>Neotree toggle<CR>")
-- --

-- Harpoon2 --
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function()
  harpoon:list():append()
end)
vim.keymap.set("n", "<C-h>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<C-q>", function()
  harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-w>", function()
  harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-e>", function()
  harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-r>", function()
  harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
  harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
  harpoon:list():next()
end)
-- --

-- Conform --
vim.keymap.set("n", "<leader>l", "<cmd> :Format<CR>", {
  desc = "Format File",
})
-- --

-- ToggleTerm --
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})
function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<C-,>", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
-- --
-- GitSigns --
vim.keymap.set("n", "<leader>gb", "<cmd> :Gitsigns toggle_current_line_blame<CR>", {
  desc = "Toggle Git Blame",
})

vim.keymap.set("n", "<leader>gs", "<cmd> :Gitsigns toggle_signs<CR>", {
  desc = "Toggle Git Signs",
})

vim.keymap.set("n", "<leader>gd", "<cmd> :Gitsigns diffthis<CR>", {
  desc = "Diff this File",
})
-- --

-- Focus --
vim.keymap.set("n", "<c-l>", function()
  require("focus").split_nicely()
end, { desc = "split nicely" })
-- --

-- Cellular Automaton --
vim.keymap.set("n", "<leader>cg", "<cmd> :CellularAutomaton game_of_life<CR>", {
  desc = "Game Of Life",
})
--
