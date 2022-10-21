vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
	-- Plugin Manager (Updates Itself)
	use 'wbthomason/packer.nvim'

	-- Colorschemes
	use 'folke/tokyonight.nvim'
	use {
		'catppuccin/nvim', as = 'catppuccin'
	}

	-- Aesthetics
	use 'norcalli/nvim-colorizer.lua'
	use {
		'kyazdani42/nvim-web-devicons',
		requires = {
			-- kyazdani42/nvim-tree.lua
			'nvim-lualine/lualine.nvim',
			'goolord/alpha-nvim',
		}
	}
	-- Language Syntax Plugins
	use 'nvim-treesitter/nvim-treesitter'
	use {
		'neovim/nvim-lspconfig',
		requires = {
			'onsails/lspkind.nvim',
		},
	}

	-- Completions
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-cmdline',
			'sar/cmp-path.nvim',
		},
	}

    -- Plenary Dependent Plugins
    use {
        'nvim-lua/plenary.nvim',
        requires = {
            'nvim-telescope/telescope.nvim',
        }
    }
end)
