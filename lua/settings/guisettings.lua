-- Gui Specific Dashboard
local dashboard = require('alpha')
local palette = require('catppuccin.palettes').get_palette()
dashboard.setup(require('alpha.themes.dashboard').config)

-- Gui Specific Globals
-- For Terminals
vim.g.terminal_color_0 = palette.surface0
vim.g.terminal_color_1 = palette.red
vim.g.terminal_color_2 = palette.green
vim.g.terminal_color_3 = palette.yellow
vim.g.terminal_color_4 = palette.blue
vim.g.terminal_color_5 = palette.pink
vim.g.terminal_color_6 = palette.teal
vim.g.terminal_color_7 = palette.subtext1
vim.g.terminal_color_8 = palette.surface2
vim.g.terminal_color_9 = palette.red
vim.g.terminal_color_10 = palette.green
vim.g.terminal_color_11 = palette.yellow
vim.g.terminal_color_12 = palette.blue
vim.g.terminal_color_13 = palette.pink
vim.g.terminal_color_14 = palette.teal
vim.g.terminal_color_15 = palette.subtext0

-- For Functions
vim.g.gui_font_face = "Iosevka"
vim.g.neovide_refresh_rate = 60
vim.g.gui_font_default_size = 12
vim.g.gui_font_size = vim.g.gui_font_default_size

-- Gui Functions
refresh_guifont = function()
	vim.o.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
end

resize_guifont = function(delta)
	vim.g.gui_font_size = vim.g.gui_font_size + delta
	refresh_guifont()
end

reset_guifont = function()
	vim.g.gui_font_size = vim.g.gui_font_default_size
	refresh_guifont()
end

reset_guifont()
local opts = {noremap = true, silent = true}

-- Gui Specific Keymaps
vim.keymap.set({'n', 'i'}, "<C-=>", function() resize_guifont(1) end, opts)
vim.keymap.set({'n', 'i'}, "<C-->", function() resize_guifont(-1) end, opts)
vim.keymap.set({'n', 'i'}, "<C-BS>", function() reset_guifont() end, opts)
