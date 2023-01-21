local lsp = require('lsp-zero')

lsp.preset('recommended')


lsp.ensure_installed({
    'tsserver',
    'gopls',
    'rust_analyzer',
    'pylsp',
})

lsp.nvim_workspace()

lsp.setup()
