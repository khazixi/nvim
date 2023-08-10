-- INFO: Test runner for unit tests in neovim
return {
    {
        'nvim-neotest/neotest',
        keys = {
            {
                '<leader>r',
                function() require('neotest').run.run() end,
                desc = 'Run Neotest'
            },
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    -- require('neotest-go')
                }
            })
        end,
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- 'nvim-neotest/neotest-go'
        },
    },
}
