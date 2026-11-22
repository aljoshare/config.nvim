return {
  {
    "neovim/nvim-lspconfig",
    version = "^2",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      -- Setup Mason
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      -- Configured servers
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                },
              },
              telemetry = { enable = false },
            },
          },
        },
        rust_analyzer = {},
        gopls = {},
        pyright = {},
        bashls = {},
        yamlls = {},
        jsonls = {},
        marksman = {},
      }

      local capabilities = require("blink.cmp").get_lsp_capabilities()

      local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
          if desc then
            desc = "LSP: " .. desc
          end
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end

        local builtin = require("telescope.builtin")
        nmap("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
        nmap("gr", builtin.lsp_references, "[G]oto [R]eferences")
        nmap("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")
        nmap("<leader>D", builtin.lsp_type_definitions, "Type [D]efinition")
        nmap("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
        nmap("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

        nmap("K", vim.lsp.buf.hover, "Hover Documentation")
        nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
        nmap("<leader>cr", vim.lsp.buf.rename, "[R]e[n]ame")
        nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

        -- Rounded diagnostic window
        vim.diagnostic.config({
          virtual_text = true,
          signs = true,
          underline = true,
          update_in_insert = false,
          severity_sort = true,
          float = {
            border = "rounded",
            source = "always",
          },
        })
      end

      local ensure_installed = vim.tbl_keys(servers)

      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
        automatic_installation = true,
        handlers = {
          function(server_name)
            local server_opts = servers[server_name] or {}
            server_opts.capabilities = capabilities
            server_opts.on_attach = on_attach
            require("lspconfig")[server_name].setup(server_opts)
          end,
        },
      })
    end,
  },
}
