return {
  { "catppuccin/nvim",        name = "catppuccin", priority = 1000 },
  { "nvim-tree/nvim-tree.lua" },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  { "rafamadriz/friendly-snippets" },
  { "nvim-pack/nvim-spectre" },
  { "RRethy/vim-illuminate" }, {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
},
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
  },
  { "mfussenegger/nvim-lint" },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      -- main one
      { "ms-jpq/coq_nvim",       branch = "coq" },

      -- 9000+ Snippets
      { "ms-jpq/coq.artifacts",  branch = "artifacts" },

      -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
      -- Need to **configure separately**
      { 'ms-jpq/coq.thirdparty', branch = "3p" }
      -- - shell repl
      -- - nvim lua api
      -- - scientific calculator
      -- - comment banner
      -- - etc
    },
    init = function()
      vim.g.coq_settings = {
        auto_start = true, -- if you want to start COQ at startup
        -- Your COQ settings here
      }
    end,
  },
  { "williamboman/mason.nvim",         "williamboman/mason-lspconfig.nvim",      "neovim/nvim-lspconfig" },
  { "nvim-treesitter/nvim-treesitter", "nvim-treesitter/nvim-treesitter-context" },
  { "stevearc/dressing.nvim" },
  { "nvim-telescope/telescope.nvim",   tag = "0.1.6" },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "ray-x/guihua.lua",               "ray-x/navigator.lua" },
  {
    "utilyre/barbecue.nvim",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { "lewis6991/gitsigns.nvim" },
  { "declancm/cinnamon.nvim" },
  { "nvim-focus/focus.nvim",          version = "*" },
  { "eandrju/cellular-automaton.nvim" },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  { "airblade/vim-rooter" },
  { "aznhe21/actions-preview.nvim" },
  { "rcarriga/nvim-dap-ui",        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
  { "roobert/action-hints.nvim" }
}
