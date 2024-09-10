return {
  -- {'folke/tokyonight.nvim', lazy = false, config = function ()
  --   vim.cmd.colorscheme('tokyonight')
  -- end },
  -- {'shaunsingh/nord.nvim'},
  -- {'ellisonleao/gruvbox.nvim'},
  -- {'shaunsingh/oxocarbon.nvim'},
  {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    name = 'catppuccin',
    config = function()
      vim.cmd.colorscheme('catppuccin')
    end,
  },
  -- {
  --   'uloco/bluloco.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   dependencies = { 'rktjmp/lush.nvim' },
  --   config = function()
  --     require("bluloco").setup({
  --       style       = "dark", -- "auto" | "dark" | "light"
  --       transparent = false,
  --       italics     = false,
  --       terminal    = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
  --       guicursor   = true,
  --     })
  --     vim.cmd.colorscheme('bluloco')
  --     -- your optional config goes here, see below.
  --   end,
  -- },
  -- {
  --   'rose-pine/neovim',
  --     lazy = false,
  --     priority = 1000,
  --   name = 'rose-pine',
  --   config = function()
  --     vim.cmd.colorscheme('rose-pine')
  --   end,
  -- }
}
