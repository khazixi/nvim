return {
    {'nvim-tree/nvim-web-devicons', lazy = false},
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        opts = {
            icons_enabled = true,
            options = {
                section_separators = { left = '', right = '' },
                theme = 'auto',
                -- section_separators =    {left = '', right = ''},
                -- component_separators =  {left = '', right = ''},
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch'},
                lualine_c = {'diff', 'diagnostics'},
                lualine_x = {'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'},
            },
            tabline = {
                lualine_a = {'filename'},
                lualine_b = {'tabs'},
                lualine_y = {'diagnostics'},
                lualine_z = {'filesize'},
            }
        },
        -- dependencies = { }
    },
    {
        'folke/noice.nvim',
        lazy = false,
        config = true,
        dependencies = {
            'rcarriga/nvim-notify',
            'MunifTanjim/nui.nvim',
        }
    },
    {
        'folke/todo-comments.nvim',
        lazy = false,
        event = 'BufReadPre',
        config = function()
        	local todo = require("todo-comments")
            vim.keymap.set('n', ']t', function() todo.jump_next() end)
            vim.keymap.set('n', '[t', function() todo.jump_prev() end)
            todo.setup()
        end,
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-tree/nvim-tree.lua',
        lazy = true,
        config = true,
        cmd = 'NvimTreeToggle',
    },
    -- TODO: Finalize the dahsboard design
    -- {
    --     
    --     'glepnir/dashboard-nvim',
    --     event = 'VimEnter',
    --     config = function()
    --         require('dashboard').setup({
    --             theme = 'doom',
    --             disable_move = true,
    --         })
    --     end,
    -- },
    {
        'norcalli/nvim-colorizer.lua',
        ft = {'css', 'svelte', 'tsx', 'jsx', 'typescript', 'javascript', 'typescriptreact', 'javascriptreact',},
        event = 'BufReadPre',
    },
}
