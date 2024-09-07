return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    priority = 900,
    build = ':TSUpdate',
    sync_install = true,
    config = function()
      require('nvim-treesitter.configs').setup({
        higlight = { enable = true },
        ensure_installed = { 'rust', 'typescript', 'javascript', 'tsx', 'html', 'css' },
        sync_install = false,
        auto_install = false,
      })
      -- NOTE: There is no longer a GCC dependency when compiling neorg parsers

      -- if vim.fn.has('macunix') then
      --   require('nvim-treesitter.install').compilers = { 'gcc-13' }
      -- end
      require('nvim-ts-autotag').setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false
        }
      })
    end,
    dependencies = {
      'windwp/nvim-ts-autotag',
    }
  },
  {
    lazy = false,
    'nvim-treesitter/nvim-treesitter-context',
    cmd = 'TSContextEnable',
    config = true,
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
    lazy = false,
    config = function()
      local rainbow_delimiters = require('rainbow-delimiters')
      require('rainbow-delimiters.setup').setup({
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          commonlisp = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          latex = 'rainbow-blocks',
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      })
    end,
  }
}
