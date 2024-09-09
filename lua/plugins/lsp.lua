-- INFO: LSP Settings
return {
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    priority = 900,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      vim.opt.signcolumn = 'yes'

      local lspconfig = require('lspconfig')

      require('ufo').setup()

      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

      require('mason').setup()

      lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
        'force',
        lspconfig.util.default_config.capabilities,
        require('cmp_nvim_lsp').default_capabilities(),
        {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true
            }
          }
        }
      )

      require('mason-lspconfig').setup({
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({})
          end,
        }
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP Actions',
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
          vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
          vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
          vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
          vim.keymap.set('n', 'go', function() vim.lsp.buf.type_definition() end, opts)
          vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
          vim.keymap.set('n', 'gs', function() vim.lsp.buf.signature_help() end, opts)
          vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end, opts)
          vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
          vim.keymap.set('n', '<F4>', function() vim.lsp.buf.code_action() end, opts)
        end,
      })

      local cmp = require('cmp')
      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'buffer' },
          { name = 'nvim_lua' },
          { name = 'luasnip' },
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        },
        completion = {
          completeopt = 'menu,menuone,noinsert'
        },
        preselect = 'item',
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
          ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
        }
      })

      vim.keymap.set({ 'i' }, '<Up>', function() require('luasnip').expand() end, { silent = true })
      vim.keymap.set({ 'i', 's' }, '<Left>', function() require('luasnip').jump(-1) end, { silent = true })
      vim.keymap.set({ 'i', 's' }, '<Right>', function() require('luasnip').jump(1) end, { silent = true })
      vim.keymap.set({ 'i', 's' }, '<Down>', function()
        if require('luasnip').choice_active() then
          require('luasnip').change_choice(1)
        end
      end, { silent = true })
    end,
    dependencies = {
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'williamboman/mason.nvim',          build = function() pcall(vim.cmd, 'MasonUpdate') end },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'kevinhwang91/nvim-ufo' },
      { 'kevinhwang91/promise-async' },
      { 'L3MON4D3/LuaSnip',                 build = 'make install_jsregexp',                     version = 'v2.*' },
      { "rafamadriz/friendly-snippets" },
      { 'saadparwaiz1/cmp_luasnip' }
    }
  },

  {
    'stevearc/conform.nvim',
    lazy = false,
    config = function()
      require('mason-conform').setup()
    end,
    dependencies = {
      { 'zapling/mason-conform.nvim' },
      { 'williamboman/mason.nvim' },
    },
  },

  {
    'mfussenegger/nvim-lint',
    lazy = false,
    config = function()
      require('mason-nvim-lint').setup()
    end,
    dependencies = {
      { 'williamboman/mason.nvim' },
      { 'rshkarin/mason-nvim-lint' }
    }
  }

  --[[
  {
    'nvimtools/none-ls.nvim',
    event = 'InsertEnter',
    lazy = false,
    priority = 700,
    config = function()
      require('mason-null-ls').setup({
        ensure_installed = {},
        automatic_installation = false,
        automatic_setup = true,
      })
      require('null-ls').setup({
        debounce = 150,
        save_after_format = false,
        require('null-ls').builtins.formatting.prettierd.with({
          extra_filetypes = { 'svelte' }
        })
      })
    end,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'williamboman/mason.nvim' },
      { 'jay-babu/mason-null-ls.nvim' },
    },
  },
  ]]

}
