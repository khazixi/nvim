-- INFO: LSP Settings
return {
  {
    -- INFO: LSP ZERO
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    priority = 900,
    lazy = false,
    config = function()
      require('lsp-zero.settings').preset({})
    end
  },
  {
    -- INFO: LSP
    'neovim/nvim-lspconfig',
    lazy = false,
    -- cmd = 'LspInfo',
    -- event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end
      },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'kevinhwang91/nvim-ufo' },
      { 'kevinhwang91/promise-async' },
      -- { 'folke/neodev.nvim', }
    },
    config = function()
      -- require("neodev").setup() -- INFO: Enables autocomplete for neovim
      local lsp = require('lsp-zero')

      vim.keymap.set('n', 'zR', function()
        require('ufo').openAllFolds()
      end)
      vim.keymap.set('n', 'zM', function()
        require('ufo').closeAllFolds()
      end)
      require('ufo').setup()

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
      end)

      require('lspconfig').volar.setup({
        autostart = false,
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
      })

      require('lspconfig').tsserver.setup({ autostart = true })

      require('lspconfig').tailwindcss.setup({ autostart = true })

      lsp.setup()
    end,
  },

  {
    -- INFO: Autocomplete
    'hrsh7th/nvim-cmp',
    lazy = false,
    -- event = 'InsertEnter',
    dependencies = {
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'saadparwaiz1/cmp_luasnip' },
      {
        'L3MON4D3/LuaSnip',
        version = "v2.*",
        build = "make install_jsregexp"
      },
      { 'rafamadriz/friendly-snippets' },
    },
    config = function()
      -- require('luasnip.lononeaders.from_vscode').lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load()
      local cmp = require('cmp')
      cmp.setup({
        preselect = 'item',
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        sources = {
          { name = 'path' },
          { name = 'calc' },
          { name = 'neorg' },
          { name = 'buffer' },
          { name = 'luasnip' },
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        }
      })
      require('lsp-zero.cmp').extend({
        set_sources = 'lsp',
        set_basic_mappings = true,
        set_extra_mappings = true,
        use_luasnip = true,
        set_format = true,
        documentation_window = true,
      }
      )
    end
  },
  {
    'nvimtools/none-ls.nvim',
    event = 'InsertEnter',
    lazy = false,
    priority = 700,
    config = function()
      require('mason-null-ls').setup({
        ensure_installed = nil,
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
}
