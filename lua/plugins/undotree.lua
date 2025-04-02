return {
  "mbbill/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  lazy = true,
  cmd = "UndotreeToggle",
  init = function()
    vim.g.undotree_SetFocusWhenToggle = 1
  end,
  keys = {
    { "<leader>ut", "<cmd>UndotreeToggle<cr>", { desc = "Undotree toggle"}}
  }
}
