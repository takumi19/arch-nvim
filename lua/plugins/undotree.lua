return {
  "mbbill/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
    vim.g.undotree_SetFocusWhenToggle = 1
  end,
}
