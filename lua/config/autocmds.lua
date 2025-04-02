-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = {
    "Makefrag",
  },
  callback = function(event)
    vim.cmd("set ft=make")
  end
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

-- vim.api.nvim_create_autocmd('CmdlineEnter', {
--     group = vim.api.nvim_create_augroup(
--         'cmdheight_1_on_cmdlineenter',
--         { clear = true }
--     ),
--     desc = 'Don\'t hide the status line when typing a command',
--     command = ':set cmdheight=1',
-- })
--
-- vim.api.nvim_create_autocmd('CmdlineLeave', {
--     group = vim.api.nvim_create_augroup(
--         'gmr_cmdheight_0_on_cmdlineleave',
--         { clear = true }
--     ),
--     desc = 'Hide cmdline when not typing a command',
--     command = ':set cmdheight=0',
-- })

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
      nowait = true,
      silent = true,
      desc = "Quit buffer",
    })
  end
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("last_loc", { clear = true }),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup(
        'DisableIndentscopeFileType',
        { clear = true }
    ),
    desc = 'Disable mini.indentscope in specific filetypes',
    pattern = {
        'lspinfo',
        'lazy',
        'checkhealth',
        'help',
        'man',
        'gitcommit',
        'NvimTree',
        'fzf',
        'mason',
        'markdown',
        'md',
        'undotree',
        '',
    },
    callback = function()
        vim.b.miniindentscope_disable = true
    end,
})
