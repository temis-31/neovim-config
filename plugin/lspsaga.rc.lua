local status, saga = pcall(require, "lspsaga")
if (not status) then return end
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- saga.init_lsp_saga {
--   show_diagnostic_source = false,
--   code_action_icon = '',
-- }

keymap('n', 'gr', '<Cmd>Lspsaga rename <Cr>', opts)
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
-- Show line diagnostics
keymap("n", "<space>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostic
keymap("n", "<space>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
