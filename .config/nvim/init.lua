--
-- NeoVim Configuration
--

-- My Config
require("myconfig.color")
require("myconfig.set")
require("myconfig.remap")

-- Plugins
require("plugins")
-- Theme
require("plugins.tokyonight")
require("plugins.nightfox")

-- Convenience
require("plugins.telescope")
--
require("plugins.treesitter")
require("plugins.lsp-zero")

require("plugins.which-key")
require("plugins.indent-blankline")
require("plugins.undotree")
require("plugins.fugitive")

require("plugins.glow")


