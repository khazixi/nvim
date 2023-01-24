return {
    {'kyazdani42/nvim-web-devicons', lazy = false},
    {
        'nvim-lualine/lualine.nvim',
        config = {
            icons_enabled = true,
            options = {
                -- section_separators =    {left = "", right = ""},
                -- component_separators =  {left = '', right = ''},
                section_separators =    {left = '', right = ''},
                component_separators =  {left = '', right = ''},
                theme = 'auto'
            },
            tabline = {
                lualine_a = {'filename'},
                lualine_b = {'tabs'},
                lualine_y = {'diagnostics'},
                lualine_z = {'filesize'},
            }
        }
    },
    {
        'goolord/alpha-nvim',
        enabled = false,
        config = function()
            require("alpha").setup(require("alpha.themes.startify").config)
        end
    },
}
