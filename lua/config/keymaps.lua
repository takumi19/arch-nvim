local map = vim.keymap.set

-- Shorthand for quitting
map("n", "<leader>qq", "<Cmd>qa<Cr>", { desc = "Close all and quit" })

-- Open lazy
map("n", "<leader>l", "<Cmd>Lazy<Cr>", { desc = "Lazy" })

-- Clear highlightsearch when pressing escape
map("n", "<Esc>", "<Esc><Cmd>nohls<CR>")

-- Better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Center the screen on some movements
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Quickfix
map("n", "]q", "<cmd>cn<cr>")
map("n", "[q", "<cmd>cp<cr>")
map("n", "<leader>qo", "<Cmd>copen<Cr>", { desc = "Open quickfix list" })

-- Buffers
map({"n", "v"}, "H", "<Cmd>bprev<Cr>")
map({"n", "v"}, "L", "<Cmd>bnext<Cr>")

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- Cmdline window
map("n", "q;", "q:")

-- Better escape
map("i", "<C-c>", "<Esc>")
-- map('i', 'jk', '<esc>', { desc = 'Use jk to enter in normal mode' })

-- Move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

map("n", "<leader>-", "<C-w>s", { desc = "Split horizontally" })
map("n", "<leader>|", "<C-w>v", { desc = "Split vertically" })

map("n", "<leader>'", "<C-^>", { desc = "Prev buffer" })
map("n", "<leader>`", "<C-^>", { desc = "Prev buffer" })

map("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Search Todo's" })
map("ia", "1=", "!=")
map("n", "U", "<cmd>ea 1f<cr>")
map("n", "<leader>bd", "<cmd>:bd<Cr>", { desc = "Delete current buffer" })

map("n", "-", "<cmd>Oil<cr>", { desc = "Open Oil file browser" })

map(
    'n',
    '<C-n>',
    ':NvimTreeFindFileToggle<cr>',
    { silent = true, desc = 'Tooggle NvimTree' }
)

map(
    'n',
    '<leader>r',
    ':NvimTreeRefresh<cr>',
    { silent = true, desc = 'Refresh NvimTree' }
)

map("n", "<M-t>", function() Snacks.terminal() end, { desc = "which_key_ignore" })
map("t", "<M-t>", "<Cmd>close<CR>")

-- Zoom and zen mode
Snacks.toggle.zoom():map("<leader>wm"):map("<leader>uZ")
Snacks.toggle.zen():map("<leader>uz")

-- replace current word/selection with clipboard
map("n", "gs", '<Cmd>%s/<c-r><c-w>/<c-r>"/g<CR>', { desc = "Substitute CW with clipboard" })

-- Persistence nvim
-- load the session for the current directory
map("n", "<leader>qs", function() require("persistence").load() end, { desc = "Load curdir session" })

-- select a session to load
map("n", "<leader>qS", function() require("persistence").select() end, { desc = "Select session" })

-- load the last session
map("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Load last session" })

-- stop Persistence => session won't be saved on exit
map("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Don't save session" })
