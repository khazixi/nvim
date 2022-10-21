local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end
	},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	formatting = {
		format = lspkind.cmp_format(),
	},

	mapping = {
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "s"}),
		["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "s"}),
		['<CR>'] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		-- ['<C-A>'] = cmp.mapping.confirm{select = true},
		-- ['<C-,>'] = cmp.mapping.confirm{select = true},
		['<C-Space>'] = cmp.mapping.complete()
	},

	sources = cmp.config.sources({
		{name = 'path'},
		-- {name = 'buffer'},
		-- {name = 'cmdline'},
		{name = 'luasnip'},
		{name = 'nvim_lsp'},
	}),

	--[[
    cmp.setup.cmdline('/', {
		sources = {
			{ name = 'buffer' },
		}
	}),
    ]]

	cmp.setup.cmdline(':', { sources = cmp.config.sources({
			{ name = 'path' },
		},
		{
			{ name = 'cmdline' },
		})
	}),

})

-- [X] Pylsp
-- [X] Clangd
-- [X] Rust-Analyzer

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')
local servers = {
	'clangd',
	'pylsp',
	'rust_analyzer',
	'sumneko_lua',
	'gopls',
	-- 'ltex',
	-- 'cssls',
	-- 'html',
	-- 'jsonls',
	'eslint',
	'jdtls'
}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- LSP Specific Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
-- Sets Up the LSP
for _, lsp in pairs(servers) do
	lspconfig[lsp].setup {
		capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
	}
end
