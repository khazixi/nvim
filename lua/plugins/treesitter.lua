return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        priority = 900,
        build = ':TSUpdate',
        sync_install = true,
        config = function()
            require("nvim-treesitter.configs").setup({
                -- autotag = {
                --     enable = true,
                --     filetypes = {
                --         'php',
                --         'jsx',
                --         'tsx',
                --         'svelete',
                --         'markdown',
                --         'javascript',
                --         'typescript',
                --         'javascriptreact',
                --         'typescriptreact',
                --     },
                -- },
                highlight = {enable = true},
                query_linter = {
                    enable = true,
                    use_virtual_text = true,
                    lint_events = { 'bufWrite', 'CursorHold' },
                },
                playground = {
                    enable = true,
                    disable ={ 'markdown', },
                    updatetime = 30,
                    persist_queries = false,
                    keybindings = {
                        toggle_query_editor = 'o',
                        toggle_hl_groups = 'i',
                        toggle_injected_languages = 't',
                        toggle_anonymous_nodes = 'a',
                        toggle_language_display = 'I',
                        focus_language = 'f',
                        unfocus_language = 'F',
                        update = 'R',
                        goto_node = '<cr>',
                        show_help = '?',
                    },
                },
                -- ensure_installed = {'c', 'cpp', 'rust', 'go', 'python', 'lua'},
            })
            -- Use GCC on Linux, Use Gcc-12 on Mac
            -- require("nvim-treesitter.install").compilers = { 'gcc' }
            require("nvim-treesitter.install").compilers = { 'gcc-12' }
        end,
        dependencies = {
        }
    },
    { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle"},
    -- {
    --     'nvim-treesitter/nvim-treesitter-context',
    --     cmd = 'TSContextEnable',
    --     config = true,
    -- },
    -- 'folke/twilight.nvim',
        -- config = true,
}
