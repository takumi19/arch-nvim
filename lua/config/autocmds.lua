-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Close with q
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "help",
    "lspinfo",
    "checkhealth",
  },
  callback = function(event)
    vim.keymap.set("n", "q", "<Cmd>q<CR>", {
      buffer = event.buf,
      -- silent = true
      desc = "Quit buffer",
    })
  end
})
