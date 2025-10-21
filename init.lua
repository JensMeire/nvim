require("config.lazy")
require("config.keymaps")

-- Set line numbers
vim.wo.number = true
-- Set cursor offset
vim.opt.scrolloff = 10
-- Set tab equal to 2 spaces
vim.opt.autoindent = true -- Copy indent from current line
vim.opt.smartindent = true -- Smarter indenting for C-like code
vim.opt.tabstop = 4 -- A tab is 4 spaces
vim.opt.shiftwidth = 4 -- Indent by 4 spaces
vim.opt.softtabstop = 4 -- <Tab>/<BS> acts like 4 spaces
vim.opt.expandtab = true -- Convert tabs to spaces
-- Set line numbers relative
vim.wo.relativenumber = true
