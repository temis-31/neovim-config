local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- formatting sources
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local lSsources = {
	formatting.prettierd.with({
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"vue",
			"css",
			"scss",
			"less",
			"json",
			"yaml",
			"graphql",
		},
		timeout = 1000,
	}),
	formatting.stylua.with({
		filetypes = {
			"lua",
		},
	}),
	-- diagnostics.eslint_d.with({
	-- 	filetypes = {
	-- 		"javascript",
	-- 		"javascriptreact",
	-- 		"typescript",
	-- 		"typescriptreact",
	-- 		"vue",
	-- 	},
	-- 	filter = function(diagnostic)
	-- 		return diagnostic.code ~= "prettier/prettier"
	-- 	end,
	-- }),
}

null_ls.setup({ sources = lSsources })

keymap("n", "<Space>lf", "<Cmd> lua vim.lsp.buf.formatting_sync() <Cr>")
