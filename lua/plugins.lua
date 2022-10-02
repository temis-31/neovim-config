local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use("wbthomason/packer.nvim")
	--Neozolarized theme
	use({
		"svrana/neosolarized.nvim",
		requires = { "tjdevries/colorbuddy.nvim" },
	})
	use("nvim-lualine/lualine.nvim") -- Statusline
	use("neovim/nvim-lspconfig") -- LSP
	use("onsails/lspkind-nvim") --vscode-like pictograms
	use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
	use("hrsh7th/nvim-cmp") -- Completion
	use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	--Mason controller
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("WhoIsSethDaniel/mason-tool-installer.nvim")

	use("glepnir/lspsaga.nvim") -- LSP UIs
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("kyazdani42/nvim-web-devicons") -- File icons
	use("nvim-lua/plenary.nvim") -- Common utilities
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use({ "nvim-telescope/telescope-fzy-native.nvim", run = "git submodule update --init --recursive"})
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
  use("p00f/nvim-ts-rainbow")
	use("norcalli/nvim-colorizer.lua")
	use("folke/zen-mode.nvim")
	--Theme Neovim
	use("EdenEast/nightfox.nvim")

	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use("akinsho/nvim-bufferline.lua") -- Buffer Line
	-- use 'github/copilot.vim'

	use("lewis6991/gitsigns.nvim")
	use("dinhhuy258/git.nvim") -- For git blame & browse
	--------
	use("glepnir/dashboard-nvim") --Dashboard
	-- Snippet
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("saadparwaiz1/cmp_luasnip")

	-- Comments
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({
		"numToStr/Comment.nvim"
		-- config = function()
		-- 	require("Comment").setup({
		-- 		module = { "Comment", "Comment.api" },
		-- 		keys = { "gc", "gb", "g<", "g>" },
		-- 		config = function()
		-- 			require("configs.Comment")
		-- 		end,
		-- 	})
		-- end,
	})
	--
end)
