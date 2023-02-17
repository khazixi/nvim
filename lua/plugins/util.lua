return {
    -- {
    --     lazy = true,
    --     'eandrju/cellular-automaton.nvim'
    -- },
    -- {
    --     'alec-gibson/nvim-tetris',
    --     cmd = "Tetris"
    -- },
    {'numToStr/Comment.nvim', config = true, lazy = false},
    {'windwp/nvim-autopairs', config = true, event = 'InsertEnter'},
    {
        'folke/zen-mode.nvim',
        config = true,
        keys = {
            {'<leader>z', '<cmd>ZenMode<cr>', desc = 'ZenMode'}
        }
    },
    {
        -- tag = '0.1.1',
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
            -- Native C fzf
            -- {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
        },
        config = function()
            require('telescope').setup({
                extensions = {
                    ['ui-select'] = require("telescope.themes").get_dropdown()
                }
            })
            require('telescope').load_extension('ui-select')
        end,
        keys = {
            {
                '<leader>ff',
                function() require('telescope.builtin').find_files() end,
                desc = 'Telescope Find Files'
            },
            {
                '<leader>fa',
                function() vim.lsp.buf.code_action() end,
                mode = {'v', 'n'},
                desc = 'Code Actions'
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
        'akinsho/toggleterm.nvim',
        config = true,
        cmd = {
            'ToggleTerm',
            'ToggleTermToggleAll',
            'TermExec'
        },
        keys = {
            {
                '<leader>tv',
                '<cmd>ToggleTerm direction=vertical',
                desc = 'Opens a Vertical Terminal'
            },
            {
                '<leader>ts',
                '<cmd>ToggleTerm direction=horizontal',
                desc = 'Opens a Horizontal Terminal'
            },
            {
                '<leader>tt',
                '<cmd>ToggleTerm direction=tab',
                desc = 'Opens a Tab Terminal'
            },
            {
                '<leader>tf',
                '<cmd>ToggleTerm direction=float',
                desc = 'Opens a Float Terminal'
            },
        }
    },
    {
        'folke/trouble.nvim',
        config = true,
        cmd = {
            'Trouble',
            'TroubleToggle',
        },
        keys = {
            {
                '<leader>xx',
                '<cmd>TroubleToggle<cr>',
                desc = 'Opens Normal Trouble Diagnostics'
            },
            {
                '<leader>xw',
                '<cmd>TroubleToggle workspace_Diagnostics<cr>',
                desc = 'Opens Trouble Diagnostics for Workspace'
            },
            {
                '<leader>xd',
                '<cmd>TroubleToggle document_Diagnostics<cr>',
                desc = 'Opens Trouble Diagnostics for Diagnostics'
            },
            {
                '<leader>xq',
                '<cmd>TroubleToggle loclist<cr>',
                desc = 'Opens Trouble Diagnostics for loclist'
            },
            {
                '<leader>xl',
                '<cmd>TroubleToggle quickfix<cr>',
                desc = 'Opens Trouble Diagnostics for quickfix'
            },
            {
                '<leader>xr',
                '<cmd>TroubleToggle lsp_references<cr>',
                desc = 'Opens Trouble Diagnostics for lsp lsp_references'
            },
        },
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
                ['core.highlights'] = {},
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
