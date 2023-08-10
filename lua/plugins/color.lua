return {
    -- {'folke/tokyonight.nvim', lazy = false, config = function ()
    --   vim.cmd.colorscheme('tokyonight')
    -- end },
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
    -- {
    --   'rose-pine/neovim',
    --     lazy = false,
    --     priority = 1000,
    --   name = 'rose-pine',
    --   config = function()
    --     vim.cmd.colorscheme('rose-pine')
    --   end,
    -- }
}
