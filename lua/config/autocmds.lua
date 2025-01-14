-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = {
    "*.nasm",
  },
  callback = function(event)
    vim.cmd("set ft=asm")
  end
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = {
    "*.c",
    "*.cpp",
  },
  callback = function(event)
    vim.cmd("set shiftwidth=4 tabstop=4 expandtab")
  end
})

-- Netrw mappings
vim.api.nvim_create_autocmd('filetype', {
  pattern = 'netrw',
  desc = 'Better mappings for netrw',
  callback = function()
    local bind = function(lhs, rhs)
      vim.keymap.set('n', lhs, rhs, { remap = true, buffer = true })
    end

    -- Go back in history
    -- bind('H', 'u')

    -- Go up a directory
    bind('h', '-^')

    -- Go down a directory / open a file
    bind('l', '<CR>')

    -- Toggle dotfiles
    bind('.', 'gh')

    -- Close preview window
    bind('P', '<C-w>z')
  end
})

-- Close with q
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "help",
    "lspinfo",
    "checkhealth",
    "qf",
  },
  callback = function(event)
    vim.keymap.set("n", "q", "<Cmd>q<CR>", {
      buffer = event.buf,
      -- silent = true
      desc = "Quit buffer",
    })
  end
})
