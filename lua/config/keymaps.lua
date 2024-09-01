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

-- map("c", "W", "w")

map("x", "<leader>p", '"_dP')

map("i", "<C-c>", "<Esc>")

-- maybe change the dwm modkey
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<leader>-", "<C-w>s", { desc = "Split horizontally" })
map("n", "<leader>|", "<C-w>v", { desc = "Split vertically" })

map("n", "<leader>'", "<C-^>", { desc = "Prev buffer" })
map("n", "<leader>`", "<C-^>", { desc = "Prev buffer" })

-- map("n", "<leader>e", "<Cmd>Ex<Cr>")

-- map("n", "<leader>cr", function ()
--   local tmux_pane_number
--   vim.system({"tmux", "display", "-p", "-t", "'{down-of}'", "'#{pane_index}'"}, )
--   vim.system({"tmux", "send-keys", "-t", "'{down-of}'", "'#{pane_index}'"}, )
--     vim.system({ "clang++", "--std=c++17", "-o", vim.fn.expand("%:r"), vim.fn.expand("%:p") })
-- end)
-- tmux display -p -t '{down-of}' '#{pane_index}' 
