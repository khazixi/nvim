local lsp = require('lsp-zero')
local cmp = require("cmp")
local lspkind = require("lspkind")

lsp.preset('recommended')

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'rust_analyzer',
        'gopls',
        'clangd',
        'neocmake',
        'tsserver',
    }
})

-- Sets Up the LSP
for _, lsp in pairs(servers) do
	lspconfig[lsp].setup()
end
