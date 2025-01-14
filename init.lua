vim.keymap.set("", "<Space>", "<Nop>")
require("config.options")
require("config.lazy")
require("config.autocmds")
require("config.keymaps")
-- require("config.statusline")
-- require("config.winbar")
vim.cmd("colorscheme gruvbox-material")

-- TODO: remove it from here
vim.api.nvim_set_hl(0, "CursorLineNr", { bold = true, fg = "#e2cca9" })
-- vim.api.nvim_set_hl(0, "StatusLineMode", { bg = "#928374", fg = "#282828" })
