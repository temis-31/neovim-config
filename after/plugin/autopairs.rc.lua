local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
	return
end

local Rule = require("nvim-autopairs.rule")

autopairs.setup({
	check_ts = true,
	enable_check_bracket_line = false,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false,
	},
	ignored_next_char = "[%w%.]",
	disable_filetype = { "TelescopePrompt", "vim" },
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0,
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "PmenuSel",
		highlight_grey = "LineNr",
	},
})

autopairs.add_rules({
	Rule("%<%>$", "</>", { "typescript", "typescriptreact", "javascript", "javascriptreact" }):use_regex(true),
})
