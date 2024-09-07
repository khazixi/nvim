return {
  { 'nvim-tree/nvim-web-devicons', lazy = false },
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    opts = {
      icons_enabled = true,
      options = {
        -- component_separators =  {left = '', right = ''},
        section_separators = { left = '', right = '' },
        theme = 'auto',
        -- section_separators =    {left = '', right = ''},
        component_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'diff', 'diagnostics' },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      tabline = {
        lualine_a = { 'filename' },
        lualine_b = { 'tabs' },
        lualine_y = { 'diagnostics' },
        lualine_z = { 'filesize' },
      }
    },
  },
  -- {
  --   'folke/noice.nvim',
  --   lazy = false,
  --   config = true,
  --   dependencies = {
  --     'MunifTanjim/nui.nvim',
  --   }
  -- },
  {
    'folke/todo-comments.nvim',
    lazy = false,
    event = 'BufReadPre',
    config = function()
      local todo = require("todo-comments")
      vim.keymap.set('n', ']t', function() todo.jump_next() end)
      vim.keymap.set('n', '[t', function() todo.jump_prev() end)
      vim.keymap.set('n', 'te', function() pcall(vim.cmd, ':TodoTelescope') end)
      todo.setup()
    end,
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },
  -- {
  --   'nvim-tree/nvim-tree.lua',
  --   config = true,
  --   cmd = 'NvimTreeToggle',
  -- },
  -- TODO: Finalize the dahsboard design
  -- {
  --
  --     'glepnir/dashboard-nvim',
  --     event = 'VimEnter',
  --     config = function()
  --         require('dashboard').setup({
  --             theme = 'doom',
  --             disable_move = true,
  --         })
  --     end,
  -- },
  {
    'NvChad/nvim-colorizer.lua',
    opts = {
      filetypes = {
        '*',
        jsx = { tailwind = true, },
        tsx = { tailwind = true, },
        html = { tailwind = true, },
        svelte = { tailwind = true, },
        javascript = { tailwind = true, },
        typescript = { tailwind = true, },
        javascriptreact = { tailwind = true, },
        typescriptreact = { tailwind = true, },
      },
      user_default_options = {
        rgb_fn = true,
        hsl_fn = true,
        tailwind = false,
        mode = 'background',
      }
    },
    ft = { 'css', 'svelte', 'tsx', 'jsx', 'vue', 'astro', 'typescript', 'javascript', 'typescriptreact',
      'javascriptreact', 'html' },
    -- event = 'BufReadPre',
  },
}
