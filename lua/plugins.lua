vim.cmd('packadd packer.nvim')

return require("packer").startup(function()
	-- Plugin Manager (Updates Itself)
	use 'wbthomason/packer.nvim'

	-- Colorschemes
	use({
        'catppuccin/nvim',
        as = 'catppuccin',
        vim.cmd('colorscheme catppuccin'),
    })
    use('folke/tokyonight.nvim')

	-- Aesthetics
	use('norcalli/nvim-colorizer.lua')
	use({
        'nvim-lualine/lualine.nvim',
        'goolord/alpha-nvim',
        -- kyazdani42/nvim-tree.lua
		requires = {
            'kyazdani42/nvim-web-devicons',
		}
	})
    use({
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
    })
	-- Language Syntax Plugins
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')
    use('mbbill/undotree')
    use('folke/zen-mode.nvim')

    -- Plenary Dependent Plugins
    use({
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
        }
    })

    -- debugger
    use({
        'mfussenegger/nvim-dap',
        'rcarriga/nvim-dap-ui',
    })

    -- Autopaitrs
    use({
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup({}) end
    })
end)
