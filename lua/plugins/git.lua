return {
  {
    'TimUntersberger/neogit',
    config = true,
    cmd = 'Neogit',
  },
  {
    'lewis6991/gitsigns.nvim',
    config = true,
    cmd = 'Gitsigns',
  },
  {
    'sindrets/diffview.nvim',
    config = true,
    cmd = { 'DiffviewFileHistory', 'DiffviewOpen' }
  },
  {
    'kdheepak/lazygit.nvim',
    config = true,
    cmd = 'LazyGit',
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  }
}
