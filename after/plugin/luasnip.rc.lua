require("luasnip.loaders.from_vscode").lazy_load({ include = { "html", "javascriptreact", "css" } })
-- require("luasnip.loaders.from_vscode").lazy_load({paths = {"/home/pool/.local/share/nvim/site/pack/packer/start/friendly-snippets"}})
require("luasnip").filetype_extend("javascript", { "javascriptreact", "html" })
require("luasnip").filetype_extend("javascriptreact", { "html", "javascript" })
