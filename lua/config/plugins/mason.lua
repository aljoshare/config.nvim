require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"gopls",
		"jsonls",
		"java_language_server",
		"jinja_lsp",
		"marksman",
		"pyright",
		"tflint",
		"yamlls",
		"terraformls",
		"bashls",
		"dockerls",
	},
})

require("lspconfig").lua_ls.setup({})
require("lspconfig").rust_analyzer.setup({})
require("lspconfig").gopls.setup({})
require("lspconfig").jsonls.setup({})
require("lspconfig").java_language_server.setup({})
require("lspconfig").jinja_lsp.setup({})
require("lspconfig").marksman.setup({})
require("lspconfig").pyright.setup({})
require("lspconfig").tflint.setup({})
require("lspconfig").yamlls.setup({})
require("lspconfig").terraformls.setup({})
require("lspconfig").bashls.setup({})
require("lspconfig").dockerls.setup({})
