--
-- Remaps
--

-- set leader
vim.g.mapleader = " "

vim.keymap.set("n","<leader>F",vim.cmd.Ex)

-- paging but stay in center
vim.keymap.set("n","<C-d>", "<C-d>zz")
vim.keymap.set("n","<C-u>", "<C-u>zz")

-- yank to system clipboard
vim.keymap.set("n","<leader>y", "\"+y")
vim.keymap.set("v","<leader>y", "\"+y")

-- paste without overwriting buffer
vim.keymap.set("x","<leader>p", "\"_dP")

-- deleting to normal mode
vim.keymap.set("n","<leader>d", "\"_d")
vim.keymap.set("v","<leader>d", "\"_d")
