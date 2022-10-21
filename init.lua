require('settings.options')

if (vim.g.neovide) then
	require('settings.guisettings')
end


require('sitter')
require('plugins')
require('completions')
require('colorshemes')

-- Keymaps go here
-- require('settings.mappings')
