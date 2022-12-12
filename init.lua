require('settings.options')

if (vim.g.neovide) then
	require('settings.guisettings')
end

require('sitter')
require('plugins')
require('colorshemes')
require('completions')


-- Keymaps go here
-- require('settings.mappings')
