return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        priority = 900,
        build = ':TSUpdate',
        sync_install = true,
        config = function()
            require('nvim-treesitter.configs').setup({
                autotag = {
                    enable = true,
                    filetypes = {
                        'js',
                        'ts',
                        'php',
                        'xml',
                        'jsx',
                        'tsx',
                        'vue',
                        'html',
                        'svelte',
                        'markdown',
                        'javascript',
                        'typescript',
                        'javascriptreact',
                        'typescriptreact',
                    },
                },
                highlight = {enable = true, disable = {'markdown'}},
                query_linter = {
                    enable = true,
                    use_virtual_text = true,
                    lint_events = { 'bufWrite', 'CursorHold' },
                },
            })
            -- NOTE: There is no longer a GCC dependency when compiling neorg parsers

            -- if vim.fn.has('macunix') then
            --   require('nvim-treesitter.install').compilers = { 'gcc-13' } 
            -- end
        end,
        dependencies = {
            'windwp/nvim-ts-autotag'
        }
    },
    {
        lazy = false,
        'nvim-treesitter/nvim-treesitter-context',
        cmd = 'TSContextEnable',
        config = true,
    },
}
