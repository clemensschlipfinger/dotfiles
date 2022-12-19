
-- Packer init
--
require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- theme
    use 'folke/tokyonight.nvim'
    use 'EdenEast/nightfox.nvim'
    
    -- treesitter
    use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }) 

      -- fuzzy finder
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { 
          {'nvim-lua/plenary.nvim'}, 
          {'BurntSushi/ripgrep'},  -- ripgrep must be installed on system
          {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
      }
    }

    -- keybindings helper
    use 'folke/which-key.nvim'

    use {
        "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
    }

    -- indent guide
    use 'lukas-reineke/indent-blankline.nvim'

    -- undotree
    use "mbbill/undotree"

    --git
    use "tpope/vim-fugitive"

    -- markdown
    use "ellisonleao/glow.nvim"

    use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
      }
    }
end)

