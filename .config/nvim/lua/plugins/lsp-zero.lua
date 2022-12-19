--
-- LSP Zero
--

local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = true,
})

vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end)
vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end)
vim.keymap.set("n", "<leader>A", function() vim.lsp.buf.format({ async = true }) end)
