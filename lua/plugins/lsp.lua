return {
    {
        'folke/neodev.nvim',
        ft = 'lua',
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
            local lsp_zero = require("lsp-zero")
            lsp_zero.preset('recommended')
            -- lsp_zero.ensure_installed({
            --     'jsonls',
            -- })
            lsp_zero.nvim_workspace()

            local cmp_sources = lsp_zero.defaults.cmp_sources()
            table.insert(cmp_sources, {name = 'neorg'})
            lsp_zero.setup_nvim_cmp({
                sources = cmp_sources
            })
            lsp_zero.setup()
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
                highlight = {enable = true, disable = {'vim'}},
                -- ensure_installed = {'c', 'cpp', 'rust', 'go', 'python', 'lua'},
            })
            require("nvim-treesitter.install").compilers = { "gcc" }
        end,
    },
}
