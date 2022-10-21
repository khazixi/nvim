vim.g.catppuccin_flavour = 'mocha'
-- vim.g.tokyonight_style = 'storm'
--
vim.cmd[[colorscheme catppuccin]]
require('colorizer').setup()
require('lualine').setup{
	options = {
		theme = 'catppuccin'
	}
}
