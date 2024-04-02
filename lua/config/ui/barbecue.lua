local navic = require("nvim-navic")

require("lspconfig").clangd.setup({
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end,
})

require("barbecue").setup({
  create_autocmd = true,
})
