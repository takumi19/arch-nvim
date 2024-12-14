return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- signs = false,
    keywords = {
      LAB = { color = "info", alt = { "LAB" } },
    },
    highlight = {
      pattern = [[.*<(KEYWORDS)]], -- pattern or table of patterns, used for highlighting (vim regex)
    },
    search = {
      command = "rg",
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
      -- regex that will be used to match keywords.
      -- don't replace the (KEYWORDS) placeholder
      pattern = [[\b(KEYWORDS(\s\w)?):]], -- ripgrep regex
    }
  },
}
