local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = "❯ ",
		path_display = { "truncate" },
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		-- find_command = { "rg", "--no-heading", "--with-filename", "--line-number", "--colum", "--smart-case" },
		initial_mode = "insert",
		--file ignore ".git/"
		file_ignore_patterns = { ".git/", "node_modules", "env/*", "dist" },
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
			n = {
				["<esc>"] = actions.close,
				["q"] = actions.close,
			},
		},
	},
	extensions = {
		file_browser = {
			theme = "dropdown",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = false,
			mappings = {
				-- your custom insert mode mappings
				["i"] = {
					["<C-w>"] = function()
						vim.cmd("normal vbd")
					end,
				},
				["n"] = {
					-- your custom normal mode mappings
					["N"] = fb_actions.create,
					["h"] = fb_actions.goto_parent_dir,
					["<Space>de"] = fb_actions.remove,
          ["<Space>mo"] = fb_actions.move,
					-- ["l"] = fb_actions.open,
					["/"] = function()
						vim.cmd("startinsert")
					end,
				},
			},
		},
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
})

telescope.load_extension("file_browser")
telescope.load_extension("fzy_native")

vim.keymap.set("n", "<Space>ff", function()
	builtin.find_files({
		no_ignore = false,
		hidden = true,
	})
end)
vim.keymap.set("n", "<Space>fw", function()
	builtin.live_grep()
end)
vim.keymap.set("n", "\\\\", function()
	builtin.buffers()
end)
vim.keymap.set("n", "sf", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		pkeviewer = false,
		ikitial_mode = "normal",
		layout_config = { height = 40 },
	})
end)
