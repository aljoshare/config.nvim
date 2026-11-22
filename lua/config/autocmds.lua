local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local general = augroup("GeneralSettings", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
  group = general,
  desc = "Highlight text on yank",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Resize splits if window is resized
autocmd("VimResized", {
  group = general,
  desc = "Resize splits on window resize",
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Return to last edit position when opening files
autocmd("BufReadPost", {
  group = general,
  desc = "Restore last cursor position",
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Close certain transient filetypes with 'q'
autocmd("FileType", {
  group = general,
  pattern = { "help", "lspinfo", "man", "notify", "qf", "checkhealth" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
  end,
})
