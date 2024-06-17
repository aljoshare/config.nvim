local lspconfig = require('lspconfig')
local coq = require('coq')
lspconfig.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {},
  },
  coq.lsp_ensure_capabilities()
}
lspconfig.gopls.setup {
  coq.lsp_ensure_capabilities()
}
lspconfig.yamlls.setup {
  coq.lsp_ensure_capabilities()
}
lspconfig.marksman.setup {
  coq.lsp_ensure_capabilities()
}
lspconfig.helm_ls.setup {
  coq.lsp_ensure_capabilities()
}
lspconfig.gitlab_ci_ls.setup {
  coq.lsp_ensure_capabilities()
}
lspconfig.jinja_lsp.setup {
  coq.lsp_ensure_capabilities()
}
lspconfig.jsonls.setup {
  coq.lsp_ensure_capabilities()
}
