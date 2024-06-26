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

-- WinCMD --
vim.keymap.set({ "t", "n" }, "<C-j>", "<cmd>:wincmd w<CR>", {
  desc = "Jump to next Window",
})

--

-- Telescope --
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {
  desc = "Find files (Telescope)"
})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
  desc = "Live Grep (Telescope)"
})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {
  desc = "Buffers (Telescope)"
})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
  desc = "Help Tags (Telescope)"
})
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {
  desc = "Old Files (Telescope)"
})
-- --

-- NeoTree --
vim.keymap.set("n", "<C-n>", "<Cmd>NvimTreeOpen<CR>", {
  desc = "Toggle NvimTree"
}
)
-- --

-- Harpoon2 --
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function()
  harpoon:list():append()
end, {
  desc = "Add file to harpoon",
})
vim.keymap.set("n", "<C-h>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, {
  desc = "Open harpoon quick menu"
})

vim.keymap.set("n", "<C-q>", function()
  harpoon:list():select(1)
end, {
  desc = "Jump to next 1) harpoon buffer"
})

vim.keymap.set("n", "<C-w>", function()
  harpoon:list():select(2)
end, {
  desc = "Jump to 2) harpoon buffer"
})

vim.keymap.set("n", "<C-e>", function()
  harpoon:list():select(3)
end, {
  desc = "Jump to 3) harpoon buffer"
})

vim.keymap.set("n", "<C-r>", function()
  harpoon:list():select(4)
end, {
  desc = "Jump to 4) harpoon buffer"
})


-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
  harpoon:list():prev()
end, {
  desc = "Jump to previous harpoon buffer"
})
vim.keymap.set("n", "<C-S-N>", function()
  harpoon:list():next()
end, {
  desc = "Jump to next harpoon buffer"
})

-- --

-- Conform --
vim.keymap.set("n", "<leader>l", "<cmd> :Format<CR>", {
  desc = "Format File",
})
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

-- Code Actions --
vim.keymap.set({ "v", "n" }, "<leader>c", require("actions-preview").code_actions, {
  desc = "Code Action"
})


-- DAP --
vim.keymap.set("n", "<leader>do", require("dapui").open, {
  desc = "Open dap-ui",
})
vim.keymap.set("n", "<leader>dc", require("dapui").close, {
  desc = "Close dap-ui",
})
vim.keymap.set("n", "<leader>dd", require("dapui").toggle, {
  desc = "Toggle dap-ui",
})

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp',
  function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)
