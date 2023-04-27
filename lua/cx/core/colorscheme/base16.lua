vim.cmd("colorscheme base16-gruvbox-material-dark-hard")
-- see all colors here https://github.com/RRethy/nvim-base16/tree/master/lua/colors

-- base00 - Default Background
-- base01 - Lighter Background (Used for status bars, line number and folding marks)
-- base02 - Selection Background
-- base03 - Comments, Invisibles, Line Highlighting
-- base04 - Dark Foreground (Used for status bars)
-- base05 - Default Foreground, Caret, Delimiters, Operators
-- base06 - Light Foreground (Not often used)
-- base07 - Light Background (Not often used)
-- base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
-- base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
-- base0A - Classes, Markup Bold, Search Text Background
-- base0B - Strings, Inherited Class, Markup Code, Diff Inserted
-- base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
-- base0D - Functions, Methods, Attribute IDs, Headings
-- base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
-- base0F - Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>

-- following setup is same as base16-gruvbox-material-dark-hard

-- require("base16-colorscheme").setup({
-- 	base00 = "#202020", -- Default Background
-- 	base01 = "#2a2827", -- Lighter Background (Used for status bars, line number and folding marks)
-- 	base02 = "#504945", -- Selection Background
-- 	base03 = "#5a524c", -- Comments, Invisibles, Line Highlighting
-- 	base04 = "#bdae93", -- Dark Foreground (Used for status bars)
-- 	base05 = "#ddc7a1", -- Default Foreground, Caret, Delimiters, Operators
-- 	base06 = "#ebdbb2", -- Light Foreground (Not often used)
-- 	base07 = "#fbf1c7", -- Light Background (Not often used)
-- 	base08 = "#ea6962", -- Variables, XML Tags, Markup Li:nk Text, Markup Lists, Diff Deleted
-- 	base09 = "#e78a4e", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
-- 	base0A = "#d8a657", -- Classes, Markup Bold, Search Text Background
-- 	base0B = "#a9b665", -- Strings, Inherited Class, Markup Code, Diff Inserted
-- 	base0C = "#89b482", -- Support, Regular Expressions, Escape Characters, Markup Quotes
-- 	base0D = "#7daea3", -- Functions, Methods, Attribute IDs, Headings
-- 	base0E = "#d3869b", -- Keywords, Storage, Selector, Markup Italic, Diff Changed
-- 	base0F = "#bd6f3e", -- Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
-- })

require("base16-colorscheme").setup({
	base00 = "#141414",
	base01 = "#262423",
	base02 = "#504945",
	base03 = "#6a625c",
	base04 = "#bdae93",
	base05 = "#ddc7a1",
	base06 = "#ebdbb2",
	base07 = "#fbf1c7",
	-- base08 = "#d3869b",
	-- base08 = "#888AA5",
	base08 = "#8E8FA9",

	base09 = "#e78a4e",
	base0A = "#d8a657",
	base0B = "#a9b665",
	base0C = "#89b482",
	base0D = "#7daea3",
	base0E = "#ea6962",
	base0F = "#bd6f3e",
})

---------------------------------------
-- for custom lsp Diagnostic colors ---
---------------------------------------
local colorscheme = require("colorscheme")
local hi = colorscheme.highlight
local colors = colorscheme.colors
hi.DiagnosticError = { guifg = colors.base0E, guibg = nil, gui = "none", guisp = nil }
hi.DiagnosticWarn = { guifg = colors.base09, guibg = nil, gui = "none", guisp = nil }
hi.DiagnosticInfo = { guifg = colors.base05, guibg = nil, gui = "none", guisp = nil }
hi.DiagnosticHint = { guifg = "#979797", guibg = nil, gui = "none", guisp = nil }
hi.DiagnosticUnderlineError = { guifg = nil, guibg = nil, gui = "undercurl", guisp = colors.base0E }
hi.DiagnosticUnderlineWarning = { guifg = nil, guibg = nil, gui = "undercurl", guisp = colors.base0E }
hi.DiagnosticUnderlineWarn = { guifg = nil, guibg = nil, gui = "undercurl", guisp = colors.base0E }
hi.DiagnosticUnderlineInformation = { guifg = nil, guibg = nil, gui = "undercurl", guisp = colors.base0F }
hi.DiagnosticUnderlineHint = { guifg = nil, guibg = nil, gui = "undercurl", guisp = "#979797" }

-- following is original colorscheme in nvim-base16
-- hi.DiagnosticError = { guifg = M.colors.base08, guibg = nil, gui = "none", guisp = nil }
-- hi.DiagnosticWarn = { guifg = M.colors.base0E, guibg = nil, gui = "none", guisp = nil }
-- hi.DiagnosticInfo = { guifg = M.colors.base05, guibg = nil, gui = "none", guisp = nil }
-- hi.DiagnosticHint = { guifg = M.colors.base0C, guibg = nil, gui = "none", guisp = nil }
-- hi.DiagnosticUnderlineError = { guifg = nil, guibg = nil, gui = "undercurl", guisp = M.colors.base08 }
-- hi.DiagnosticUnderlineWarning = { guifg = nil, guibg = nil, gui = "undercurl", guisp = M.colors.base0E }
-- hi.DiagnosticUnderlineWarn = { guifg = nil, guibg = nil, gui = "undercurl", guisp = M.colors.base0E }
-- hi.DiagnosticUnderlineInformation = { guifg = nil, guibg = nil, gui = "undercurl", guisp = M.colors.base0F }
-- hi.DiagnosticUnderlineHint = { guifg = nil, guibg = nil, gui = "undercurl", guisp = M.colors.base0C }
--
-- hi.LspReferenceText = { guifg = nil, guibg = nil, gui = "underline", guisp = M.colors.base04 }
-- hi.LspReferenceRead = { guifg = nil, guibg = nil, gui = "underline", guisp = M.colors.base04 }
-- hi.LspReferenceWrite = { guifg = nil, guibg = nil, gui = "underline", guisp = M.colors.base04 }
-- hi.LspDiagnosticsDefaultError = "DiagnosticError"
-- hi.LspDiagnosticsDefaultWarning = "DiagnosticWarn"
-- hi.LspDiagnosticsDefaultInformation = "DiagnosticInfo"
-- hi.LspDiagnosticsDefaultHint = "DiagnosticHint"
-- hi.LspDiagnosticsUnderlineError = "DiagnosticUnderlineError"
-- hi.LspDiagnosticsUnderlineWarning = "DiagnosticUnderlineWarning"
-- hi.LspDiagnosticsUnderlineInformation = "DiagnosticUnderlineInformation"
-- hi.LspDiagnosticsUnderlineHint = "DiagnosticUnderlineHint"

---------------------------------------
-- for custom illuminate style ---
---------------------------------------
local hl_cursor = "#3D3936" -- this color is blender of base01 and base02

if colorscheme.config.illuminate then
	hi.IlluminatedWordText = { guifg = nil, guibg = hl_cursor, gui = "none", guisp = nil }
	hi.IlluminatedWordRead = { guifg = nil, guibg = hl_cursor, gui = "none", guisp = nil }
	hi.IlluminatedWordWrite = { guifg = nil, guibg = hl_cursor, gui = "none", guisp = nil }
end

-- original config
-- if M.config.illuminate then
--     hi.IlluminatedWordText  = { guifg = nil, guibg = nil, gui = 'underline', guisp = M.colors.base04 }
--     hi.IlluminatedWordRead  = { guifg = nil, guibg = nil, gui = 'underline', guisp = M.colors.base04 }
--     hi.IlluminatedWordWrite = { guifg = nil, guibg = nil, gui = 'underline', guisp = M.colors.base04 }
-- end


-- fix semantic highlighting for neovim 0.9.0
-- for more info see:https://www.reddit.com/r/neovim/comments/12gvms4/this_is_why_your_higlights_look_different_in_90/
-- and : https://gist.github.com/swarn/fb37d9eefe1bc616c2a7e476c0bc0316
local links = {
  ['@lsp.type.namespace'] = '@namespace',
  ['@lsp.type.type'] = '@type',
  ['@lsp.type.class'] = '@type',
  ['@lsp.type.enum'] = '@type',
  ['@lsp.type.interface'] = '@type',
  ['@lsp.type.struct'] = '@structure',
  ['@lsp.type.parameter'] = '@parameter',
  ['@lsp.type.variable'] = '@variable',
  ['@lsp.type.property'] = '@property',
  ['@lsp.type.enumMember'] = '@constant',
  ['@lsp.type.function'] = '@function',
  ['@lsp.type.method'] = '@method',
  ['@lsp.type.macro'] = '@macro',
  ['@lsp.type.decorator'] = '@function',
}
for newgroup, oldgroup in pairs(links) do
  vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
end
