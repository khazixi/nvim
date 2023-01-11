local treesitter = require('nvim-treesitter.configs')

treesitter.setup{
	ensure_installed = {
		'c', 'cpp', 'lua',
		'python', 'rust', 'go',
		'html', 'json', 'css',
		'javascript', 'typescript',
        -- 'java', 'julia', 'fortran',
        'cmake',
		-- 'glsl'
	},

	highlight = {
		enable = true
	},
}
