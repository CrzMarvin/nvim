-- https://github.com/wbthomason/packer.nvim
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Autocomman that reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- My plugins here
	-- personName
	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	-- use("bluz71/vim-nightfly-guicolors")
	-- use("rebelot/kanagawa.nvim")
	-- use("gruvbox-community/gruvbox")
	-- use("sainnhe/gruvbox-material")
	-- use("folke/tokyonight.nvim")
	-- use({ "catppuccin/nvim", as = "catppuccin" })
	-- use({ "rose-pine/neovim", as = "rose-pine" })
	-- use({
	-- 	"svrana/neosolarized.nvim",
	-- 	requires = { "tjdevries/colorbuddy.nvim" },
	-- })
	use("RRethy/nvim-base16")

	use("szw/vim-maximizer") -- maximizes and restores current window

	-- tmux & split window navigation
	use("christoomey/vim-tmux-navigator")

	-- essential plugins
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	-- cheatsheet ysw" ds" cs"'
	use("vim-scripts/ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	-- cheatsheet gcc (comment or uncomment line), gc8j comment 8 lines
	-- vi(gc va(gc vi{gc vi{gc for block
	use("numToStr/Comment.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- vs-code like icons
	use("kyazdani42/nvim-web-devicons")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- indent lines
	use("lukas-reineke/indent-blankline.nvim")

	-- bufferline
	-- use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

	-- -- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
	-- use({ "nvim-telescope/telescope-media-files.nvim" }) -- media files previewer
	use({ "ThePrimeagen/harpoon" })

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- colorized
	use("norcalli/nvim-colorizer.lua")

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- copilot
	use("github/copilot.vim")

	-- lsp
	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
	use("RRethy/vim-illuminate") -- highlighting other uses of the word under the cursor using
	-- use("folke/lsp-colors.nvim") -- lsp diagnostics colors
	use("folke/todo-comments.nvim")
	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
	use("dinhhuy258/git.nvim") -- For git blame & brows
	use("tpope/vim-fugitive")

	-- for tailwindcss-colors highlight
	use({
		"themaxmarchuk/tailwindcss-colors.nvim",
		-- load only on require("tailwindcss-colors")
		module = "tailwindcss-colors",
		-- run the setup function after plugin is loaded
		config = function()
			-- pass config options here (or nothing to use defaults)
			require("tailwindcss-colors").setup()
		end,
	})
  -- for gpt nvim
	use({
		"jackMort/ChatGPT.nvim",
		config = function()
			require("chatgpt").setup({
        -- setup OPENAI_API_KEY = "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",
        api_key_cmd = "echo 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",
      })
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})
	-- image preview ( currently not working )
	-- use {'edluffy/hologram.nvim'}
	-- use("wfxr/minimap.vim")
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
