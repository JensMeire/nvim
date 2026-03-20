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

map("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
map("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
map("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
map("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

map("n", "<leader>eh", function()
  require("snacks").notifier.show_history()
end, { desc = "Show notifications" })
-- Debugger (nvim-dap/dap-ui) for Ruby and more
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "Start/Continue Debugging" })
map("n", "<leader>di", function()
  require("dap").step_into()
end, { desc = "Step Into" })
map("n", "<leader>do", function()
  require("dap").step_over()
end, { desc = "Step Over" })
map("n", "<leader>dO", function()
  require("dap").step_out()
end, { desc = "Step Out" })
map("n", "<leader>dr", function()
  require("dap").repl.toggle()
end, { desc = "Toggle REPL" })
map("n", "<leader>du", function()
  require("dap-view").toggle()
end, { desc = "Toggle Debugger UI" })
