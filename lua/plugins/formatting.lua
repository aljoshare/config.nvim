return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = { "n", "v" },
        desc = "Format file or range",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format", "ruff_organize_imports" },
        rust = { "rustfmt" },
        go = { "goimports", "gofmt" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        json = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
        markdown = { "prettierd", "prettier", stop_after_first = true },
      },
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return {
          timeout_ms = 500,
          lsp_fallback = true,
        }
      end,
    },
    config = function(_, opts)
      require("conform").setup(opts)

      vim.api.nvim_create_user_command("FormatToggle", function(args)
        if args.bang then
          vim.b.disable_autoformat = not vim.b.disable_autoformat
          print("Autoformat (buffer): " .. (vim.b.disable_autoformat and "disabled" or "enabled"))
        else
          vim.g.disable_autoformat = not vim.g.disable_autoformat
          print("Autoformat (global): " .. (vim.g.disable_autoformat and "disabled" or "enabled"))
        end
      end, {
        desc = "Toggle format-on-save (! for buffer)",
        bang = true,
      })
    end,
  },
}
