local status, icons = pcall(require, "nvim-web-devicons")
if not status then
	return
end

icons.setup({
	-- your personnal icons can go here (to override)
	-- DevIcon will be appended to `name`
	override = {
		fish = {
			icon = "",
			color = "#4d5a5e",
			cterm_color = "59",
			name = "Fish",
		},
		cjs = {
			icon = "",
			color = "#3be228",
			-- cterm_color = "65",
			name = "fish",
		},
		folder = {
			color = "#42A5F5",
		},
	},
	-- globally enable default icons (default to false)
	-- will get overriden by `get_icons` option
	default = true,
})

