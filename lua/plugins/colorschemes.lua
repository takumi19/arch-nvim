return {
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("everforest").setup({
        transparent_background_level = 1
      })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    -- priority = 1000,
    opts = {
      transparent_mode = true,
    },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    -- priority = 1000,
    name = "catppuccin",
    -- or just use opts table
    opts = {
      flavour = "frappe",
    },
  },
  {
    "joshdick/onedark.vim",
    lazy = true,
    -- priority = 1000,
    name = "onedark",
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    -- priority = 1000,
    disable_background = true,
    styles = {
      transparency = true,
    },
  },
}
