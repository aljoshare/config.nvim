return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Oil",
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory with Oil" },
      { "<leader>-", "<cmd>Oil --float<cr>", desc = "Open parent directory in floating window" },
    },
    opts = {
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 2,
        max_width = 90,
        max_height = 0,
      },
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = function()
      local harpoon = require("harpoon")
      return {
        {
          "<leader>ha",
          function()
            harpoon:list():add()
          end,
          desc = "Harpoon add file",
        },
        {
          "<leader>hh",
          function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon quick menu",
        },
        {
          "<leader>1",
          function()
            harpoon:list():select(1)
          end,
          desc = "Harpoon buffer 1",
        },
        {
          "<leader>2",
          function()
            harpoon:list():select(2)
          end,
          desc = "Harpoon buffer 2",
        },
        {
          "<leader>3",
          function()
            harpoon:list():select(3)
          end,
          desc = "Harpoon buffer 3",
        },
        {
          "<leader>4",
          function()
            harpoon:list():select(4)
          end,
          desc = "Harpoon buffer 4",
        },
        {
          "<C-S-P>",
          function()
            harpoon:list():prev()
          end,
          desc = "Harpoon previous buffer",
        },
        {
          "<C-S-N>",
          function()
            harpoon:list():next()
          end,
          desc = "Harpoon next buffer",
        },
      }
    end,
    opts = {},
  },
}
