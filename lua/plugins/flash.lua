return {
  "folke/flash.nvim",
  lazy = true,
  -- event = "VeryLazy",
  opts = {
    modes = {
      char = {
        enabled = true,
        highlight = {
          backdrop = false,
          matches = false,
          -- comment out the following line to enable character highlighting
          groups = { "" },
        },
      }
    }
  },
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  }
}
