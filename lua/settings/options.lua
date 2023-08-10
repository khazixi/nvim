-- Options
vim.o.ru = true
vim.o.tgc = true
vim.o.rnu = true
vim.o.wrap = false
vim.o.number = true
vim.o.cursorline = true
vim.o.smartindent = true
vim.o.completeopt = 'menu,menuone'

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

-- INFO: This is for nvim-ufo
vim.o.foldenable = true
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

-- vim.o.spell = true
-- vim.o.spl = 'en_us'


-- if os.getenv("$TERM_PROGRAM") == "iTerm.app" then
--     vim.fn.system({
--         'defaults',
--         'write',
--         'com.googecode.iterm2',
--         'TerminalMargin',
--         '-int',
--         '0'
--     })
-- end


-- Globals
-- vim.g.clipboard = 'unnamedplus'
-- vim.g.tokyonight_style = 'storm'
--
-- vim.cmd[[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll]]
