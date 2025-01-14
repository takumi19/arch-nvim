return {
  'stevearc/oil.nvim',
  -- event = "VeryLazy",
  cmd = "Oil",
  config = function()
    require('oil').setup {
      view_options = {
        show_hidden = true
      }
    }
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
