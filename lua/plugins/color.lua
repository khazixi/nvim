-- TODO: hi
return {
    { 'folke/tokyonight.nvim', lazy = false },
    {'ellisonleao/gruvbox.nvim', lazy = false},
    {'shaunsingh/oxocarbon.nvim', lazy = false},
    'norcalli/nvim-colorizer.lua',
    {
        'folke/todo-comments.nvim',
        lazy = false,
        config = function()
        	local todo = require("todo-comments")
		vim.keymap.set('n', ']t', function() todo.jump_next() end)
		vim.keymap.set('n', '[t', function() todo.jump_prev() end)
		todo.setup()
        end,
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
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
