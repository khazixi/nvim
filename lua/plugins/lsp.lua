return {
    {
        'folke/neodev.nvim',
        ft = 'lua',
        config = true,
    },

    -- {
    --     'hrsh7th/nvim-cmp',
    --     priority = 800,
    --     config = function()
    --         local cmp = require("cmp")
    --         local luasnip = require("luasnip")
    --         cmp.setup({
    --             snippet = {
    --                 expand = function(args)
    --                     luasnip.lsp_expand(args.body)
    --                 end
    --             },
    --             window = {
    --                 documentation = cmp.config.window.bordered()
    --             },
    --             formatting = {
    --                 fields = {'menu', 'abbr', 'kind'},
    --                 format = function(entry, item)
    --                     local menu_icon = {
    --                         nvim_lsp = 'λ',
    --                         luasnip = '⋗',
    --                         buffer = 'Ω',
    --                         path = '🖫',
    --                     }
    --
    --                     item.menu = menu_icon[entry.source.name]
    --                     return item
    --                 end,
    --             },
    --             mappings = {
    --                 ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    --                 ['<Down>'] = cmp.mapping.select_next_item(select_opts),
    --
    --                 ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    --                 ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
    --
    --                 ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    --                 ['<C-f>'] = cmp.mapping.scroll_docs(4),
    --
    --                 ['<C-e>'] = cmp.mapping.abort(),
    --                 ['<CR>'] = cmp.mapping.confirm({select = false}),
    --
    --                 ['<C-d>'] = cmp.mapping(function(fallback)
    --                   if luasnip.jumpable(1) then
    --                     luasnip.jump(1)
    --                   else
    --                     fallback()
    --                   end
    --                 end, {'i', 's'}),
    --
    --                 ['<C-b>'] = cmp.mapping(function(fallback)
    --                   if luasnip.jumpable(-1) then
    --                     luasnip.jump(-1)
    --                   else
    --                     fallback()
    --                   end
    --                 end, {'i', 's'}),
    --
    --                 ['<Tab>'] = cmp.mapping(function(fallback)
    --                   local col = vim.fn.col('.') - 1
    --
    --                   if cmp.visible() then
    --                     cmp.select_next_item(select_opts)
    --                   elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    --                     fallback()
    --                   else
    --                     cmp.complete()
    --                   end
    --                 end, {'i', 's'}),
    --
    --                 ['<S-Tab>'] = cmp.mapping(function(fallback)
    --                   if cmp.visible() then
    --                     cmp.select_prev_item(select_opts)
    --                   else
    --                     fallback()
    --                   end
    --                 end, {'i', 's'}),
    --             },
    --             sources = cmp.config.sources({
    --                 { name = 'path' },
    --                 { name = 'buffer', keyword_length = 3 },
    --                 { name = 'luasnip', keyword_length = 2 },
    --                 { name = 'nvim_lsp', keyword_length = 3 },
    --                 { name = 'nvim_lua', keyword_length = 3 },
    --                 { name = 'neorg' },
    --             })
    --         })
    --     end,
    --     dependencies = {
    --         {'hrsh7th/cmp-buffer'},
    --         {'hrsh7th/cmp-path'},
    --         {'hrsh7th/cmp-nvim-lsp'},
    --         {'hrsh7th/cmp-nvim-lua'},
    --
    --         -- Snippets
    --         {'L3MON4D3/LuaSnip'},
    --         {'saadparwaiz1/cmp_luasnip'},
    --         {'rafamadriz/friendly-snippets'},
    --     },
    -- },
    -- {
    --     {'neovim/nvim-lspconfig'},
    --     config = function()
    --         require("mason").setup()
    --         require("mason-lspconfig").setup()
    --         local lspconfig = require("lspconfig")
    --         local lsp_defaults = lspconfig.util.default_config
    --
    --         lsp_defaults.capabilities = vim.tbl_deep_extend(
    --             'force',
    --             lsp_defaults.capabilities,
    --             require("cmp_nvim_lsp").default_capabilities()
    --         )
    --     end,
    --     dependencies = {
    --         'williamboman/mason.nvim',
    --         'williamboman/mason-lspconfig.nvim',
    --     },
    -- },

    -- LSP - ZERO
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
		  -- LSP Support
            {'neovim/nvim-lspconfig'},
            { 'williamboman/mason.nvim', config = true },
            { 'williamboman/mason-lspconfig.nvim', config = true },

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            {'saadparwaiz1/cmp_luasnip'},
            -- Extra-Autocomplete
            {'hrsh7th/cmp-calc'},
            -- {'f3fora/cmp-spell'},
            -- {'kdheepak/cmp-latex-symbols'},
            -- {'hrsh7th/cmp-emoji'},
            -- {'ray-x/cmp-treesitter'},


            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
	    },
        lazy = false,
        -- event = 'InsertEnter',
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.preset('recommended')
            lsp_zero.nvim_workspace()
            lsp_zero.setup_nvim_cmp({
                sources = {
                    {name = 'path'},
                    {name = 'calc'},
                    {name = 'neorg'},
                    {name = 'buffer'},
                    {name = 'luasnip'},
                    {name = 'nvim_lsp'},
                    {name = 'nvim_lua'},
                    -- {name = 'spell', option = {
                    --     keep_all_entries = false,
                    --     enable_in_context = true
                    -- }},
                    -- {name = 'emoji', insert = true},
                    -- {name = 'treesitter'},
                    -- {name = 'latex_symbols', option = { strategy = 0 }}
                }
            })
            lsp_zero.setup()
        end
    },
    {
        'kevinhwang91/nvim-ufo',
        event = 'UIEnter',
        opts = {},
        init = function()
            vim.keymap.set('n', 'zR', function()
                require('ufo').openAllFolds()
            end)
            vim.keymap.set('n', 'zM', function()
                require('ufo').closeAllFolds()
            end)
        end, dependencies = {
            'kevinhwang91/promise-async',
        }
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        event = 'InsertEnter',
        lazy = false,
        -- priority = 700,
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = nil,
                automatic_installation = false,
                automatic_setup = true,
            })
            require('null-ls').setup({
                debounce = 150,
                save_after_format = false,
            })
            require("mason-null-ls").setup_handlers()
        end,
        dependencies = {
            {'nvim-lua/plenary.nvim'},
            {'williamboman/mason.nvim', config = true },
            {'jay-babu/mason-null-ls.nvim'},
        },
    },
}
