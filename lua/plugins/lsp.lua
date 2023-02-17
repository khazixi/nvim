return {

    -- LSP - ZERO
    {
        'folke/neoconf.nvim',
        lazy = false,
        config = true,
        priority = 850,
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
		  -- LSP Support
            {'neovim/nvim-lspconfig'},
            { 'williamboman/mason.nvim', config = true },
            { 'williamboman/mason-lspconfig.nvim', config = true },

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            {'saadparwaiz1/cmp_luasnip'},
            -- Extra-Autocomplete
            {'hrsh7th/cmp-calc'},
            -- {'f3fora/cmp-spell'},
            -- {'kdheepak/cmp-latex-symbols'},
            -- {'hrsh7th/cmp-emoji'},
            -- {'ray-x/cmp-treesitter'},


            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
	    },
        lazy = false,
        priority = 800,
        -- event = 'InsertEnter',
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.preset('recommended')
            lsp_zero.nvim_workspace()
            lsp_zero.setup_nvim_cmp({
                sources = {
                    {name = 'path'},
                    {name = 'calc'},
                    {name = 'neorg'},
                    {name = 'buffer'},
                    {name = 'luasnip'},
                    {name = 'nvim_lsp'},
                    {name = 'nvim_lua'},
                    -- {name = 'spell', option = {
                    --     keep_all_entries = false,
                    --     enable_in_context = true
                    -- }},
                    -- {name = 'emoji', insert = true},
                    -- {name = 'treesitter'},
                    -- {name = 'latex_symbols', option = { strategy = 0 }}
                }
            })
            lsp_zero.setup()
        end
    },
    {
        'folke/neodev.nvim',
        ft = 'lua',
        config = true,
    },
    {
        'kevinhwang91/nvim-ufo',
        event = 'UIEnter',
        opts = {},
        init = function()
            vim.keymap.set('n', 'zR', function()
                require('ufo').openAllFolds()
            end)
            vim.keymap.set('n', 'zM', function()
                require('ufo').closeAllFolds()
            end)
        end, dependencies = {
            'kevinhwang91/promise-async',
        }
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        event = 'InsertEnter',
        lazy = false,
        priority = 700,
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = nil,
                automatic_installation = false,
                automatic_setup = true,
            })
            require('null-ls').setup({
                debounce = 150,
                save_after_format = false,
            })
            require("mason-null-ls").setup_handlers()
        end,
        dependencies = {
            {'nvim-lua/plenary.nvim'},
            {'williamboman/mason.nvim'},
            {'jay-babu/mason-null-ls.nvim'},
        },
    },
}
