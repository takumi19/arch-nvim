local map = vim.keymap.set

map("n", "<leader>qq", "<Cmd>qa<Cr>", { desc = "Close all and quit" })
map("n", "<leader>l", "<Cmd>Lazy<Cr>", { desc = "Lazy" })
map("n", "<Esc>", "<Esc><Cmd>nohls<CR>")

map("n", "j", "gj")
map("n", "k", "gk")
map("v", "j", "gj")
map("v", "k", "gk")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- quickfix
map("n", "]q", "<cmd>cn<cr>")
map("n", "[q", "<cmd>cp<cr>")
map("n", "<leader>qo", "<Cmd>copen<Cr>", { desc = "Open quickfix list" })

map({"n", "v"}, "H", "<Cmd>bprev<Cr>")
map({"n", "v"}, "L", "<Cmd>bnext<Cr>")

map("x", "<leader>p", '"_dP')

map("i", "<C-c>", "<Esc>")
-- map('i', 'jk', '<esc>', { desc = 'Use jk to enter in normal mode' })

-- maybe change the dwm modkey
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<leader>-", "<C-w>s", { desc = "Split horizontally" })
map("n", "<leader>|", "<C-w>v", { desc = "Split vertically" })

map("n", "<leader>'", "<C-^>", { desc = "Prev buffer" })
map("n", "<leader>`", "<C-^>", { desc = "Prev buffer" })

map("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Search Todo's" })
map("ia", "1=", "!=")
map("n", "U", "<cmd>ea 1f<cr>")
map("n", "<leader>bd", "<cmd>:bd<Cr>", { desc = "Delete current buffer" })

map("n", "<C-e>", "<cmd>Oil<cr>", { desc = "Open Oil file browser" })

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

-- replace current word/selection with clipboard
map("n", "gs", '<Cmd>%s/<c-r><c-w>/<c-r>"/g<CR>', { desc = "Substitute CW with clipboard" })

map("n", "<leader>qs", function() require("persistence").load() end, { desc = "Load last session" })

-- Persistence nvim
-- load the session for the current directory
map("n", "<leader>qs", function() require("persistence").load() end)

-- select a session to load
map("n", "<leader>qS", function() require("persistence").select() end)

-- load the last session
map("n", "<leader>ql", function() require("persistence").load({ last = true }) end)

-- stop Persistence => session won't be saved on exit
map("n", "<leader>qd", function() require("persistence").stop() end)
-- map("n", "<leader>e", "<Cmd>Ex<Cr>")

-- map("n", "<leader>cr", function ()
--   local tmux_pane_number
--   vim.system({"tmux", "display", "-p", "-t", "'{down-of}'", "'#{pane_index}'"}, )
--   vim.system({"tmux", "send-keys", "-t", "'{down-of}'", "'#{pane_index}'"}, )
--     vim.system({ "clang++", "--std=c++17", "-o", vim.fn.expand("%:r"), vim.fn.expand("%:p") })
-- end)
-- tmux display -p -t '{down-of}' '#{pane_index}' 
