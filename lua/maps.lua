local keymap = vim.keymap

-- Do not yank
keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<Space><C-a>", "gg<S-v>G")

-- New tab
keymap.set("n", "te", ":tabedit<Return>", { silent = true })
--Split window
keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true })
keymap.set("n", "sd", ":vsplit<Return><C-w>w", { silent = true })

--Move window
-- keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "<C-h>", "<C-w>h")
keymap.set("", "<C-k>", "<C-w>k")
keymap.set("", "<C-j>", "<C-w>j")
keymap.set("", "<C-l>", "<C-w>l")

-- Resize window
keymap.set("n", "<C-right>", "<C-w><")
keymap.set("n", "<C-left>", "<C-w>>")
keymap.set("n", "<C-up>", "<C-w>+")
keymap.set("n", "<C-down>", "<C-w>-")

-- Block key
-- keymap.set("i", "<esc>", "<C-c>")
keymap.set("i", "jk", "<C-\\><C-N>")
-- keymap.set("i", "kk", "<esc>")

-- Disable arrow key
keymap.set("", "<up>", "<nop>")
keymap.set("", "<down>", "<nop>")
keymap.set("", "<left>", "<nop>")
keymap.set("", "<right>", "<nop>")

--Delete Session
keymap.set("n", "<Space>q", "<Cmd> wq <Cr>")
keymap.set("n", "<Space>w", "<Cmd> w <Cr>")
keymap.set("n", "<Space>a", "<Cmd> qa! <Cr>")
keymap.set("n", "<C-q>", "<Cmd> q! <Cr>")

--Comments
keymap.set("n", "<Space>0", '<Cmd>lua require("Comment.api").toggle.linewise.current() <Cr>')
keymap.set("v", "<Space>0", '<Esc><Cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<Cr>')

--Terminal mode
keymap.set("t","jk", "<C-\\><C-N>") --Exit

