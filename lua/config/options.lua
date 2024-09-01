local opt = vim.opt

-- TODO: finish formatting
-- opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
-- opt.formatoptions = "jcroqlnt" -- tcqj
-- opt.grepformat = "%f:%l:%c:%m" -- should default to this anyway
-- opt.mouse = "a" -- read mouse events in all modes
-- opt.pumblend = 10 -- popup blend
-- opt.pumheight = 10 -- Maximum number of entries in a popup
-- opt.wildmode = "longest:full,full" -- Command-line completion mode
-- vim.g.markdown_recommended_style = 0
-- some folding stuff

-- is_x_display = function()
--   local x_display = os.getenv("DISPLAY")
--   return x_display ~= nil and x_display ~= ""
--   return true
-- end

-- TODO: sync not working
-- vim.g.clipboard = { -- install xclip
-- name = "xclip",
--   copy = {
--     ["+"] = "xclip -f -sel clip",
--     ["*"] = "xclip -f -sel clip",
--   },
--   paste = {
--     ["+"] = "xclip -o -sel clip",
--     ["*"] = "xclip -o -sel clip",
--   },
--   cache_enabled = 1,
-- }

local cursor_options = {
  "n-v-c:block",
  "i-ci-ve:ver25",
  "r-cr:hor20",
  "o:hor50",
  "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
  "sm:block-blinkwait175-blinkoff150-blinkon175",
}

vim.opt.guicursor = cursor_options
vim.opt.cursorlineopt = "both"

opt.clipboard:append("unnamedplus") -- sync with system clipboard
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true                  -- confirm to save changes before exiting modified buffer
opt.expandtab = true                -- spaces instead of tabs
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true      -- Ignore case when searching
opt.inccommand = "nosplit" -- preview incremental substitute -- NOTE: "split" shows all that is matching in a preview window
opt.jumpoptions = "view"   -- keep number of lines from top to position when jumping through jump/changelist
opt.laststatus = 2         -- only show one statusline
opt.linebreak = true       -- smarter wraps
opt.list = true            -- show invisible characters like tab
opt.number = true          -- Line number
opt.relativenumber = true  -- Relative numbers
opt.scrolloff = 2          -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "folds", "globals", "help", "localoptions", "options", "winsize", "skiprtp" }
opt.shiftround = true -- round indent
opt.shiftwidth = 2    -- indent size
opt.shortmess:append({ W = true, c = true, C = true }) -- I = true to remove intro message
opt.sidescrolloff = 8
opt.signcolumn = "yes" -- always show the signcolumn, otherwise marks and stuff would shift the text each time -- NOTE: readup
opt.smartcase = true   -- Don't ignore case with capitals
opt.smartindent = true -- insert indents automatically
opt.splitbelow=true
opt.splitbelow = true  -- Put new windows below current
opt.splitkeep="screen"
opt.splitright=true
opt.tabstop = 2          -- each tab is 2 spaces
opt.termguicolors = true -- full color support (might be redundant)
opt.timeoutlen = 1000
opt.undofile = true      -- write changes to a fiel and load em back when file is opened
opt.undolevels = 10000   -- maximum number of changes that can be undone
opt.updatetime = 500     -- milliseconds idle before swap file being written to disk
opt.winminwidth = 5
opt.wrap = false

-- Other
-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
--   opts = opts or {}
--   opts.border = opts.border or border
--   return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end
