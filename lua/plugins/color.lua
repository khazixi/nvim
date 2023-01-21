return {
    'folke/tokyonight.nvim',
    'ellisonleao/gruvbox.nvim',
    'shaunsingh/oxocarbon.nvim',
    'norcalli/nvim-colorizer.lua',
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
