local map = vim.keymap.set
local wk = require("which-key")

wk.add({ "<leader>w", group = "Window" })
map("n", "<leader>wh", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<leader>wj", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<leader>wk", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<leader>wl", "<C-w>l", { desc = "Go to Right Window", remap = true })

map("n", "<leader>w|", "<C-w>v", { desc = "Split Window Vertically" })
map("n", "<leader>w-", "<C-w>s", { desc = "Split Window Horizontally" })

map("n", "<leader>sf", ":w<cr>", { desc = "Save File" })
map("n", "<leader>sa", ":wa<cr>", { desc = "Save All" })

map("n", "<leader>fq", "<cmd>Telescope quickfix<CR>", { desc = "Open Quickfix" })
map("n", "<leader>fr", "<cmd>Telescope resume<CR>", { desc = "Resume last pick" })

map("n", "<leader>gb", "<cmd>BlameToggle<CR>", { desc = "Toggle Git Blame" })

vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -
