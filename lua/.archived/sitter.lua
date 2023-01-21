local treesitter = require('nvim-treesitter.configs')

treesitter.setup{
	ensure_installed = {
		'c', 'cpp', 'lua',
		'python', 'rust', 'go',
		'html', 'json', 'css',
		'javascript', 'typescript',
        'query',
        -- 'java', 'julia', 'fortran',
        'cmake',
		-- 'glsl'
	},

    ignore_install = {'vim'},

	highlight = {
		enable = true,
        disable = {"vim"},
	},

}
