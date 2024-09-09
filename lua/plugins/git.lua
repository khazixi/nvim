return {
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
    cmd = {
      'LazyGit',
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  }
}
