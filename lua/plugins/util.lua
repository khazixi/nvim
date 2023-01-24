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
        end,
        keys = {
            {'<leader>z', '<cmd>ZenMode<cr>'}
        }
    },
    {
        tag = '0.1.1',
        lazy = 'true',
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- Native C fzf
            -- {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
        },
        config = function()
            local telescope = require("telescope")
            telescope.setup({})
            -- telescope.load_extension('fzf')
        end,
        keys = {
            {
                '<leader>ff',
                function() require('telescope.builtin').find_files() end,
            },
            {
                '<leader>fg',
                function() require("telescope.builtin").live_grep() end
            },
            {
                '<leader>fb',
                function() require("telescope.builtin").buffers() end
            },
            {
                '<leader>fh',
                function() require("telescope.builtin").help_tags() end
            },
        }
    },
    {
        'windwp/nvim-autopairs',
        config = {}
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
