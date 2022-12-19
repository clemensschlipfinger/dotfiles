--
-- Telescope Configuration 
--

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')


local builtin = require('telescope.builtin')

vim.keymap.set('n','<leader>ff',builtin.find_files,{});
vim.keymap.set('n','<leader>fg',builtin.git_files,{});
vim.keymap.set('n','<leader>fs', builtin.live_grep, {});
