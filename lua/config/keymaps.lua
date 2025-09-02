local map = vim.keymap.set
local wk = require("which-key")

wk.add({ "<leader>w", group = "Window" })
map("n", "<leader>wh", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<leader>wj", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<leader>wk", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<leader>wl", "<C-w>l", { desc = "Go to Right Window", remap = true })

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fr", "<cmd>Telescope old_files<cr>", { desc = "Find recent files" })
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string" })

map("n", "<S-H>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })
map("n", "<S-L>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "<S-W>", "<cmd>BufferLinePickClose<cr>", { desc = "Pick to close" })
map("n", "<S-G>", "<cmd>BufferLinePick<cr>", { desc = "Pick to go to" })
map("n", "<leader>sf", ":w<cr>", { desc = "Save File" })
map("n", "<leader>sa", ":wa<cr>", { desc = "Save All" })
