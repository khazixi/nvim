-- vim.cmd('command! DapEnable lua print("Dap Running")')
-- vim.keymap.set('n', '<leader>tv', '<cmd> vsplit | term<cr>')
-- vim.keymap.set('n', '<leader>ts', '<cmd> split  | term<cr>')
-- vim.keymap.set('n', '<leader>tt', '<cmd> tabnew | term<cr>')

-- Non plugin neovim binds go here:
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '<leader>w', function()
    vim.lsp.buf.format()
end)
vim.keymap.set('n', '<leader>p', function()
  print('hi')
end)
-- vim.keymap.set('n', 'h', 'gh')
-- vim.keymap.set('n', 'l', 'gl')

-- Plugin specific binds are set in their respective plugin files
