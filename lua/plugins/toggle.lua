return {
  -- TODO: try boole.nvim instead
  'rmagatti/alternate-toggler',
  config = function()
    require("alternate-toggler").setup {
      alternates = {
        ["false"] = "true"
      }
    }

    vim.keymap.set(
      "n",
      "<leader>i",
      "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>"
    )
  end,
  event = { "BufReadPost" }, -- lazy load after reading a buffer
}
