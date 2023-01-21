return {
    'eandrju/cellular-automaton.nvim',
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    {
        'folke/zen-mode.nvim',
        config = function()
            require('zen-mode').setup()
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
        },
        config = function()
            local telescope = require("telescope")
            telescope.setup({})
            telescope.load_extension('fzf')
        end
    },
    {
        'nvim-neorg/neorg',
        ft = 'norg',
        opts = {
            load = {
                ['core.defaults'] = {},
                ['core.norg.concealer'] = {},
                ['core.norg.completion'] = {
                    config = {engine = 'nvim-cmp'}
                },
                ['core.integrations.nvim-cmp'] = {},
            }
        },
        dependencies = {
            'hrsh7th/nvim-cmp',
        }
    }
}
