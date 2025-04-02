return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.mkdp_browser = "/usr/local/bin/surf"
  end,
  ft = { "markdown" },
  config = function()
    vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>")
    vim.keymap.set("n", "<leader>ms", ":MarkdownPreviewStop<CR>")

    -- vim.g.mkdp_markdown_css = vim.fn.stdpath("config") .. "/assets/md.css"
    -- vim.g.mkdp_highlight_css = vim.fn.stdpath("config") .. "/assets/mdhl.css"
  end,
}
