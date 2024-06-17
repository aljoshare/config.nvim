return {
  require("lualine").setup({
    options = {
      theme = "catppuccin",
      globalstatus = true,
    },
    sections = {
      lualine_x = { require("action-hints").statusline },
    },
  }),
}
