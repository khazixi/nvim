require('settings.options')
require("settings.mappings")

if (vim.g.neovide) then
	require('settings.guisettings')
end

require('sitter')
require('plugins')
-- require('mason').setup()
-- require('mason-lspconfig').setup()
require('colorshemes')
require('completions')

-- Keymaps go here
-- require('settings.mappings')
