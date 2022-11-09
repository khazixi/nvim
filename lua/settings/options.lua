-- Options
vim.o.ru = true
vim.o.tgc = true
vim.o.rnu = true
vim.o.number = true
vim.o.cursorline = true
vim.o.completeopt = 'menu,menuone'

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

-- Globals
-- vim.g.clipboard = 'unnamedplus'
-- vim.g.tokyonight_style = 'storm'
--
vim.cmd[[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll]]
