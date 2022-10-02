--vim.lsp.set_log_level("debug")
local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end
local sign_define = vim.fn.sign_define

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}
for _, sign in ipairs(signs) do
	sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
	-- disable virtual text
	virtual_text = true,
	-- show signs
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
	client.resolved_capabilities.document_formatting = false
	-- Formating
	-- if client.server_capabilities.documentFormattingProvider then
	--  vim.api.nvim_command [[augroup Format]]
	-- vim.api.nvim_command [[autocmd! * <buffer>]]
	-- vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
	-- vim.api.nvim_command [[augroup END]]
	-- end
end

-- TS Server
nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	-- handlers = { ["textDocument/publishDiagnostics"] = function(...) end },
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
})

-- Lua Language Server sumneko_lua
nvim_lsp.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
			},
		},
	},
})

nvim_lsp.html.setup({
	capabilities = capabilities,
})

nvim_lsp.cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
