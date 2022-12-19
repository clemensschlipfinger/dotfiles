--
-- NeoVim Set Configuration
--

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- disable error bells
vim.opt.errorbells = false

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- indent
vim.opt.smartindent = true

-- line wrapping
vim.opt.wrap = false

-- file history  
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
vim.opt.undofile = true

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true 

-- set 24-bit RGB Colors
vim.opt.termguicolors = true

-- scroll
vim.opt.scrolloff = 8

-- signs
vim.opt.signcolumn = "yes"

-- spell check
vim.opt.spell = true
