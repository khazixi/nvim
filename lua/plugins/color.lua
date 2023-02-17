return {
    -- {'folke/tokyonight.nvim', lazy = false },
    -- {'shaunsingh/nord.nvim'},
    -- {'ellisonleao/gruvbox.nvim'},
    -- {'shaunsingh/oxocarbon.nvim'},
    {
        'catppuccin/nvim',
        lazy = false,
        priority = 1000,
        name = 'catppuccin',
        config = function()
            vim.g.catppuccin_flavour = 'mocha'
            vim.cmd.colorscheme('catppuccin')
        end,
    },
}
