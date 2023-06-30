local M = {}

M.mapleader = " " -- space key as leader key

vim.g.mapleader = M.mapleader

-- 可以参考layzVim 配置: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- api: vim.keymap.set(mode, lhs, rhs, opts)
-- keymap opt 解释:
-- silent = true：键盘映射执行时不在命令行中显示映射的命令。
-- nowait = true：键盘映射执行后立即返回，而不等待其他键的输入。
-- noremap = true：禁用递归映射，确保在执行映射时不会被其他映射再次触发。
-- des: 人类友好的描述

-- 基于通用opts配置增加描述的方法
local opts = { silent = true, nowait = true, noremap = true }
local function optsAddDesc(desc)
	local newOpts = vim.tbl_extend("force", opts, { desc = desc })
	return newOpts
end
-- e.g. keymap.set("n", "<leader>q", ":q<CR>", optsAddDesc("quit"))

local keymap = vim.keymap -- for conciseness 为了简洁

---------------------
-- General Keymaps
---------------------

-- keymap.set("i", "jk", "<C-c>") -- ctrl-c is differenct from esc, for esc will trigger the auto completion.
keymap.set("i", "jk", "<Esc>") -- i for insert mode jk wil be the short cut for ESC
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x') -- in normal mode use x to delete a character will not cut to clipboard

-- common quit
keymap.set("n", "<leader>q", "<C-c>") -- quit

keymap.set("n", "<leader>qq", "<cmd>bdelete!<cr>", optsAddDesc("quit current buffer without save"))

-- select block of {
keymap.set("n", "<leader>vf", "va{V")

-- keymap.set("n", "<leader>+", "<C-a>")
-- keymap.set("n", "<leader>-", "<C-x>")

-- window management
keymap.set("n", "<leader>s\\", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>s-", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sw", ":close<CR>") -- close current split window

-- keymap.set("n", "<leader>\\", "<C-v>") -- this is for telescope when want to split file aside

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tw", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

keymap.set("n", "<leader>pu", "<PageUp>") -- page up
keymap.set("n", "<leader>pd", "<PageDown>") -- page down
keymap.set("n", "<leader>pp", "<PageDown>") -- page down alias

-- for search and replace
keymap.set("n", "n", "nzzzv") -- n for next search result, zzzv for center the search result
keymap.set("n", "N", "Nzzzv") -- N for previous search result, zzzv for center the search result
keymap.set("n", "<leader>sr", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>") -- search and replace the word under cursor
keymap.set("n", "<leader>wr", ":%s/") -- search and replace the word under cursor

-- for yank or delete in register
keymap.set("n", "<leader>py", '"0p')
keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')
keymap.set("v", "<leader>Y", '"+Y')
keymap.set("n", "<leader>d", '"_d')
keymap.set("v", "<leader>d", '"_d')

-- for show current file path
-- keymap.set("n", "<leader>fn", ":echo expand('%:p')<CR>")
-- for copy current file path
-- keymap.set("n", "<leader>fn", ":let @+ = expand('%:p') | call system('pbcopy', @+)<CR>")
-- for copy current file path and show it
keymap.set("n", "<leader>sfn", ":let @+ = expand('%:p') | call system('pbcopy', @+)<CR>:echo expand('%:p')<CR>")

-- for refractor
keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line downk
keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move line up

-- for copy whole file
keymap.set("n", "<leader>fy", ":%y<CR>")

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>sf", ":NvimTreeFindFile<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>") -- show all registered keymaps
keymap.set("n", "<leader>fi", "<cmd>Telescope current_buffer_fuzzy_find<cr>") -- fuzy search in current filed
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- show all registered keymaps
keymap.set("n", "<leader>km", "<cmd>Telescope keymaps<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gba", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]
-- for vim-fugitive
keymap.set("n", "<leader>gi", "<cmd>Git<cr>")

-- for code snippet
keymap.set("i", "<C-n>", "<Plug>luasnip-next-choice", {})
keymap.set("s", "<C-n>", "<Plug>luasnip-next-choice", {})
keymap.set("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
keymap.set("s", "<C-p>", "<Plug>luasnip-prev-choice", {})

-- for add word to dictionary
keymap.set("n", "<leader>zg", "", {})

-- for toggle format
keymap.set("n", "<leader>fm", ":lua vim.lsp.buf.format()<cr>", {})

-- for clear snipt cache when bug hapens
keymap.set("n", "<leader>cl", "<cmd>LuaSnipUnlinkCurrent<cr>", {})

-- for jump between recent two files
keymap.set("n", "<leader>fn", "<C-^>", {})

-- NOTE: check if spell is on or off :set spell?
-- for toggle spell
keymap.set("n", "<leader>cs", function()
	vim.o.spell = not vim.o.spell
	print("spell: " .. tostring(vim.o.spell))
end, {})

-- for chatGPT
keymap.set("n", "<leader>ai", ":ChatGPT<CR>") -- open new tab

--  for cmp
--  NOTE: this is setup in plugins-config/nvim-cmp.lua
-- mapping = cmp.mapping.preset.insert({
-- 	["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
-- 	["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
-- 	["<C-b>"] = cmp.mapping.scroll_docs(-4),
-- 	["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 	["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
-- 	-- ["<C-e>"] = cmp.mapping.abort(), -- close completion window
-- 	["jq"] = cmp.mapping.abort(), -- close completion window
-- 	["<CR>"] = cmp.mapping.confirm({ select = false }),
-- })

--  for lsp
--  this is set in plugins-config/lsp/lspconfig.lua
-- 	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
-- 	keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
-- 	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
-- 	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
-- 	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
-- 	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
-- 	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
-- 	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
-- 	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
-- 	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
-- keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
-- keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
--
-- -- Show line diagnostics
-- -- You can pass argument ++unfocus to
-- -- unfocus the show_line_diagnostics floating window
-- keymap.set("n", "[l", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
--
-- -- Show buffer diagnostics
-- keymap.set("n", "[b", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts)
--
-- -- Show workspace diagnostics
-- keymap.set("n", "[a", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts)
-- 	-- Only jump to error
-- 	keymap.set("n", "[e", function()
-- 		require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- 	end, { silent = true })
-- 	keymap.set("n", "]e", function()
-- 		require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
-- 	end, { silent = true })
-- 	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
-- 	keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
--
-- 	-- typescript specific keymaps (e.g. rename file and update imports)
-- 	if client.name == "tsserver" then
-- 		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
-- 		keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
-- 		keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
-- 	end

-- keymap.set("n", "<leader>n", function()
-- 	require("illuminate").goto_next_reference()
-- end, silent)
--
-- keymap.set("n", "<leader>n", "<a-n>", silent)

-- for harpoon
keymap.set("n", "<leader>ha", function()
	require("harpoon.mark").add_file()
end, { silent = true, desc = "Add file to harpoon" })
keymap.set("n", "<leader>hp", function()
	require("harpoon.ui").toggle_quick_menu()
end, { silent = true, desc = "Toggle harpoon menu" })

keymap.set("n", "<leader>1", function()
	require("harpoon.ui").nav_file(1)
end, { silent = true, desc = "Navigate to harpoon file 1" })
keymap.set("n", "<leader>2", function()
	require("harpoon.ui").nav_file(2)
end, { silent = true, desc = "Navigate to harpoon file 2" })
keymap.set("n", "<leader>3", function()
	require("harpoon.ui").nav_file(3)
end, { silent = true, desc = "Navigate to harpoon file 3" })
keymap.set("n", "<leader>4", function()
	require("harpoon.ui").nav_file(4)
end, { silent = true, desc = "Navigate to harpoon file 4" })

-- todo-comments
vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- vim surround
-- https://github.com/tpope/vim-surround
-- `ysw"` `ysiw'`  add surround
-- hello =>  "hello"
-- `cs'"` change surround
-- 'hello world' => "hello world"
-- `ds'` delete surround
-- 'hello world' => hello world

-- 多行加surround:
-- 进入行v模式:  V
-- 选择
-- S{

return M
