vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<C-p>", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<C-n>", vim.diagnostic.goto_next)

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	end,
})

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"rust_analyzer",
		"tsserver",
	}
})

local lspconfig = require("lspconfig")
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
require('mason-lspconfig').setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			capabilities = lsp_capabilities,
		})
	end,
})

