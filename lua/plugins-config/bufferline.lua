-- -- current not used
-- local status, bufferline = pcall(require, "bufferline")
-- if not status then
-- 	return
-- end
-- vim.opt.termguicolors = true
-- bufferline.setup()
-- -- bufferline.setup({
-- -- 	options = {
-- -- 		mode = "tabs",
-- -- 		separator_style = "slant",
-- -- 		always_show_bufferline = false,
-- -- 		show_buffer_close_icons = false,
-- -- 		show_close_icon = false,
-- -- 		color_icons = true,
-- -- 	},
-- -- 	highlights = {
-- -- 		separator = {
-- -- 			fg = "#073642",
-- -- 			bg = "#002b36",
-- -- 		},
-- -- 		separator_selected = {
-- -- 			fg = "#073642",
-- -- 		},
-- -- 		background = {
-- -- 			fg = "#657b83",
-- -- 			bg = "#002b36",
-- -- 		},
-- -- 		buffer_selected = {
-- -- 			fg = "#fdf6e3",
-- -- 			bold = true,
-- -- 		},
-- -- 		fill = {
-- -- 			bg = "#073642",
-- -- 		},
-- -- 	},
-- -- })
-- --
-- -- vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
-- -- vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})

-- copy from https://github.com/wbthomason/dotfiles/blob/main/dot_config/nvim/lua/config/bufferline.lua
local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end
vim.opt.termguicolors = true
local map = vim.api.nvim_set_keymap
-- local bufferline = require 'bufferline'

local bar_bg = "#1f1f1f"
local bar_fg = "#c9c9c9"
local elem_bg = "#2d2d2d"
local elem_fg = "#8c8c8c"
local selected_bg = "#444444"
local selected_fg = "#efefef"
local error_fg = "#ca241a"
local warning_fg = "#fabd2f"
local info_fg = "#83a5cb"
local pick_fg = "#870000"

local colors = {
	bar = { fg = bar_fg, bg = bar_bg },
	elem = { fg = elem_fg, bg = elem_bg },
	elem_inactive = { fg = elem_fg, bg = elem_bg },
	elem_selected = { fg = selected_fg, bg = selected_bg },
	separator = { fg = bar_bg, bg = elem_bg },
	separator_selected = { fg = bar_bg, bg = selected_bg },
	error = { fg = error_fg, bg = elem_bg, sp = error_fg },
	error_selected = { fg = error_fg, bg = selected_bg },
	warning = { fg = warning_fg, bg = elem_bg, sp = warning_fg },
	warning_selected = { fg = warning_fg, bg = selected_bg },
	info = { fg = info_fg, bg = elem_bg, sp = info_fg },
	info_selected = { fg = info_fg, bg = selected_bg },
	pick = { fg = pick_fg, bg = elem_bg },
	pick_selected = { fg = pick_fg, bg = selected_bg },
}

local diagnostics_signs = {
	["error"] = "",
	warning = "",
	hint = "",
	-- default = '',
	default = "i",
}

local highlights
if vim.g.colors_name ~= "nazgul" then
	highlights = nil
else
	highlights = {
		background = colors.elem_inactive,
		buffer_selected = colors.elem_selected,
		buffer_visible = colors.elem_inactive,
		close_button = colors.elem,
		close_button_selected = colors.elem_selected,
		close_button_visible = colors.elem,
		diagnostic = colors.info,
		diagnostic_selected = colors.info_selected,
		diagnostic_visible = colors.info,
		duplicate = colors.elem,
		duplicate_selected = colors.elem_selected,
		duplicate_visible = colors.elem,
		error = colors.error,
		error_diagnostic = colors.error,
		error_diagnostic_selected = colors.error_selected,
		error_selected = colors.error_selected,
		fill = colors.bar,
		hint = colors.info,
		hint_diagnostic = colors.info,
		hint_diagnostic_selected = colors.info_selected,
		hint_diagnostic_visible = colors.info,
		hint_selected = colors.info_selected,
		hint_visible = colors.info,
		info = colors.info,
		info_diagnostic = colors.info,
		info_diagnostic_selected = colors.info_selected,
		info_diagnostic_visible = colors.info,
		info_selected = colors.info_selected,
		info_visible = colors.info,
		modified = colors.elem,
		modified_selected = colors.elem_selected,
		modified_visible = colors.elem,
		pick = colors.pick,
		pick_selected = colors.pick_selected,
		separator = colors.separator,
		separator_selected = colors.separator_selected,
		separator_visible = colors.separator,
		tab = colors.elem,
		tab_close = colors.bar,
		tab_selected = colors.elem_selected,
		warning = colors.warning,
		warning_diagnostic = colors.warning,
		warning_diagnostic_selected = colors.warning_selected,
		warning_diagnostic_visible = colors.warning,
		warning_selected = colors.warning_selected,
		warning_visible = colors.warning,
	}
end

bufferline.setup({
	options = {
		always_show_bufferline = false, -- 只有在有多个buffer的时候才显示
		diagnostics = "nvim_lsp",
    -- 这段代码是使用了lsp的诊断信息来添加到bufferline的右侧
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " " -- bufferline额外字符串
			for e, n in pairs(diagnostics_dict) do
        -- e 是诊断信息的类型，n是数量
				if e ~= "hint" and e ~= "info" then -- 这里会过滤掉hint和info类型的诊断信息
					local sym = diagnostics_signs[e] or diagnostics_signs.default
					s = s .. (#s > 1 and " " or "") .. sym .. " " .. n
				end
        -- 这是原来的代码，显示所有的诊断信息
				-- local sym = diagnostics_signs[e] or diagnostics_signs.default
				-- s = s .. (#s > 1 and ' ' or '') .. sym .. ' ' .. n
			end
			return s
		end,
		separator_style = "slant",
	},
	highlights = highlights,
})

-- keymap opt 解释:
-- silent = true：键盘映射执行时不在命令行中显示映射的命令。
-- nowait = true：键盘映射执行后立即返回，而不等待其他键的输入。
-- noremap = true：禁用递归映射，确保在执行映射时不会被其他映射再次触发。
-- des: 人类友好的描述

local opts = { silent = true, nowait = true, noremap = true }

local function optsAddDesc(desc)
	local newOpts = vim.tbl_extend("force", opts, { desc = desc })
	return newOpts
end

map("n", "<leader>hh", "<cmd>BufferLinePick<cr>", optsAddDesc("BufferLine: Pick"))
map(
	"n",
	"<leader>xx",
	"<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>",
	optsAddDesc("BufferLine: Close all others ")
)
map("n", "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", optsAddDesc("BufferLine: Go to buffer 1"))
map("n", "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", optsAddDesc("BufferLine: Go to buffer 2"))
map("n", "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", optsAddDesc("BufferLine: Go to buffer 3"))
map("n", "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", optsAddDesc("BufferLine: Go to buffer 4"))
map("n", "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", optsAddDesc("BufferLine: Go to buffer 5"))

