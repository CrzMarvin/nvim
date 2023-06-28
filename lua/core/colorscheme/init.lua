-- gruvbox
-- vim.cmd("colorscheme nightfly")
-- vim.g.gruvbox_contrast_dark = "hard"
-- vim.opt.background = "dark"
-- vim.g.gruvbox_contrast = "hard"
-- local status, _ = pcall(vim.cmd, "colorscheme gruvbox")

-- gruvbox-material
-- doc `:help gruvbox-material.txt`
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_foreground = "mix"
local status, _ = pcall(vim.cmd, "colorscheme gruvbox-material")

if not status then
	print("Colorscheme not found!")
	return
end

-- kanagawa
-- Default options:
-- require("kanagawa").setup({
-- 	undercurl = true, -- enable undercurls
-- 	commentStyle = { italic = true },
-- 	functionStyle = {},
-- 	keywordStyle = { italic = true },
-- 	statementStyle = { bold = true },
-- 	typeStyle = {},
-- 	variablebuiltinStyle = { italic = true },
-- 	specialReturn = true, -- special highlight for the return keyword
-- 	specialException = true, -- special highlight for exception handling keywords
-- 	transparent = false, -- do not set background color
-- 	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
-- 	globalStatus = false, -- adjust window separators highlight for laststatus=3
-- 	terminalColors = true, -- define vim.g.terminal_color_{0,17}
-- 	colors = {},
-- 	overrides = {},
-- 	theme = "default", -- Load "default" theme or the experimental "light" theme
-- })
--
-- -- setup must be called before loading
-- vim.cmd("colorscheme kanagawa")

-- primeagen
-- vim.g.theprimeagen_colorscheme = "rose-pine"
--
-- require("catppuccin").setup({
-- 	transparent_background = false,
-- })
--
function ColorMyPencils()
	-- 	vim.g.gruvbox_contrast_dark = "hard"
	-- 	vim.g.tokyonight_transparent_sidebar = true
	-- 	vim.g.tokyonight_transparent = true
	-- 	vim.g.gruvbox_invert_selection = "0"
	-- 	vim.opt.background = "dark"
	--
	-- 	vim.cmd("colorscheme " .. vim.g.theprimeagen_colorscheme)
	--
	local hl = function(thing, opts)
		vim.api.nvim_set_hl(0, thing, opts)
	end
	--
	-- 	hl("SignColumn", {
	-- 		bg = "none",
	-- 	})
	--
	-- hl("ColorColumn", {
	-- 	ctermbg = 0,
	-- 	bg = "#2B79A0",
	-- })
	--
	-- 	-- hl("CursorLineNR", {
	-- 	-- 	bg = "None",
	-- 	-- })
	--
	hl("Normal", {
		bg = "none",
		-- fg = "#FF9EE9",
	})
	--
	-- 	-- hl("LineNr", {
	-- 	-- 	fg = "#5eacd3",
	-- 	-- })
	--
	-- 	-- hl("netrwDir", {
	-- 	-- 	fg = "#5eacd3",
	-- 	-- })
end
ColorMyPencils()

-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_transparent_sidebar = true
--
-- --[[
-- vim.g.tokyonight_colors = {
--   fg = "#839496",
--   fg_dark = "#586e75",
--   fg_gutter = "#073642",
--   bg_highlight = "#002b36",
--   comment = "#586e75",
--   blue = "#268bd2",
--     cyan = "#2aa198",
--     blue1 = "#2ac3de",
--     blue2 = "#0db9d7",
--     blue5 = "#89ddff",
--     blue6 = "#B4F9F8",
--   yellow = "#b58900",
--   orange = "#cb4b16",
--   magenta = "#d33682",
--   purple = "#6c71c4",
-- }
-- ]]
--
-- vim.cmd([[colorscheme tokyonight]])
