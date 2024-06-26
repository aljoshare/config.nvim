require("conform").setup({
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 500, lsp_fallback = true }
  end,
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { "prettierd", "prettier" },
    yaml = { "yamlfmt" },
    yml = { "yamlfmt" },
  },
  formatters = {
    stylua = {
      -- Change where to find the command
      command = "~/.cargo/bin/stylua",
    },
  },
})
require("conform").formatters.yamlfmt = {
  prepend_args = { "--regex_exclude", ".*{({|%).*(}|%)}.*" },
}
