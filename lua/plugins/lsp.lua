return {
    {
        'folke/neodev.nvim',
        config = function()
            require("neodev").setup()
        end
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
		  -- LSP Support
            {'neovim/nvim-lspconfig'},
            {
                'williamboman/mason.nvim',
                config = function()
                    require('mason').setup()
                end,
            },
            {
                'williamboman/mason-lspconfig.nvim',
                config = function()
                    require('mason-lspconfig').setup()
                end
            },

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
	    },
        config = function()
            local lsp = require("lsp-zero")
            lsp.preset('recommended')
            lsp.ensure_installed({
                'tsserver',
                'html',
                'jsonls',
                'gopls',
                'dockerls',
                'rust_analyzer',
                'pylsp',
            })
            lsp.configure("html", {
                filetypes = {'html', 'tmpl'},
            })
            lsp.nvim_workspace()
            lsp.setup()
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        priority = 999,
        build = ':TSUpdate',
        sync_install = true,
        config = function()
            require("nvim-treesitter.configs").setup({
                highlight = {enable = true},
                ensure_installed = {'c', 'cpp', 'rust', 'go', 'python', 'lua'},
            })
        end,
        highlight = {
            enable = true,
            disable = {'vim'}
        }
    },
}
