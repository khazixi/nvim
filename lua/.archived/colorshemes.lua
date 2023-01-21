vim.g.catppuccin_flavour = 'mocha'
-- vim.g.tokyonight_style = 'storm'

vim.cmd.colorscheme "catppuccin"
require('colorizer').setup()
require('lualine').setup({
    icons_enabled = true,
	options = {
        -- section_separators =    {left = "", right = ""},
        -- component_separators =  {left = '', right = ''},
        section_separators =    {left = '', right = ''},
        component_separators =  {left = '', right = ''},
		theme = 'catppuccin'
	},

    tabline = {
        lualine_a = {'filename'},
        lualine_b = {'tabs'},
        lualine_y = {'diagnostics'},
        lualine_z = {'filesize'},
    }
})
