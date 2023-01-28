return {
    {
        lazy = true,
        'eandrju/cellular-automaton.nvim'
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
    },
    {
        'folke/zen-mode.nvim',
        config = function()
            require('zen-mode').setup()
        end,
        keys = {
            {'<leader>z', '<cmd>ZenMode<cr>', desc = 'ZenMode'}
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
                desc = 'Telescope Find Files'
            },
            {
                '<leader>fg',
                function() require("telescope.builtin").live_grep() end,
                desc = 'Telescope Live Grep'
            },
            {
                '<leader>fb',
                function() require("telescope.builtin").buffers() end,
                desc = 'Telescope Buffers'
            },
            {
                '<leader>fh',
                function() require("telescope.builtin").help_tags() end,
                desc = 'Telescope Help Tags'
            },
            {
                '<leader>ft',
                function() require("telescope.builtin").treesitter() end,
                desc = 'Telescope Treesitter'
            },
            {
                '<leader>fm',
                function()
                    require('telescope.builtin').man_pages({'ALL'})
                end,
                desc = 'Telescope Man Pages'
            },
            {
                '<leader>fc',
                function()
                    require('telescope.builtin').colorscheme()
                end,
                desc = 'Telescope Colorschemes'
            },
            {
                '<leader>fk',
                function()
                    require('telescope.builtin').keymaps()
                end,
                desc = 'Telescope Keymaps'
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
                ['core.norg.completion'] = {
                    config = {engine = 'nvim-cmp'}
                },
                ['core.norg.concealer'] = {},
                ['core.export.markdown'] = {},
                ['core.integrations.nvim-cmp'] = {},
                ['core.integrations.treesitter'] = {},
            }
        },
        dependencies = {
            'nvim-lua/plenary.nvim',
        }
    }
}
