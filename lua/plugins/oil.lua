return {
  'stevearc/oil.nvim',
  -- event = "VeryLazy",
  lazy = vim.fn.argc(-1) == 0,
  cmd = "Oil",
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      view_options = {
        show_hidden = true
      }
    }
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
