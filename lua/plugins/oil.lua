return {
  'stevearc/oil.nvim',
  event = "VeryLazy",
  config = function ()
    require('oil').setup { 
      view_options = {
        show_hidden = true
      }
    }
    vim.keymap.set("n", "<C-e>", "<cmd>Oil<cr>", { desc = "Open Oil file browser" })
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
