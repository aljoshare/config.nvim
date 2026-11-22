return {
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
      spec = {
        { "<leader>c", group = "[C]ode" },
        { "<leader>f", group = "[F]ind / Telescope" },
        { "<leader>g", group = "[G]it" },
        { "<leader>h", group = "[H]arpoon" },
        { "<leader>w", group = "[W]orkspace" },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "catppuccin",
        component_separators = "|",
        section_separators = "",
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
}
