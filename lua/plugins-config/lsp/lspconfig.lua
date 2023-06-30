-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

local protocol = require("vim.lsp.protocol")

local keymap = vim.keymap -- for conciseness

local function optsAddDesc(opts, desc)
	local newOpts = vim.tbl_extend("force", opts, { desc = desc })
	return newOpts
end

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", optsAddDesc(opts, "Lspsaga: lsp finder")) -- show definition, references
	keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", optsAddDesc(opts, "Lspsaga: go to definition")) -- got to definition(定义)
	keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", optsAddDesc(opts, "Lspsaga: peek definition")) -- see definition and make edits in window
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", optsAddDesc(opts, "Lspsaga: go to implementation")) -- go to implementation(实现细节) 

	-- for lsp saga
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", optsAddDesc(opts, "Lspsaga: code action")) -- see available code actions
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", optsAddDesc(opts, "Lspsaga: rename")) -- smart rename
	-- conflict with slient delete
	-- keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	-- keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor

	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer

	-- Show line diagnostics
	-- You can pass argument ++unfocus to
	-- unfocus the show_line_diagnostics floating window
	keymap.set("n", "[l", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

	-- Show buffer diagnostics
	keymap.set("n", "[b", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts)

	-- Show workspace diagnostics
	keymap.set("n", "[a", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts)

	-- Floating terminal
	-- keymap.set({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>", opts)

	-- Only jump to error
	keymap.set("n", "[e", function()
		require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end)
	keymap.set("n", "]e", function()
		require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
	end)
	-- keymap.set("n", "[e", function()
	-- 	require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
	-- end, { silent = true })
	-- keymap.set("n", "]e", function()
	-- 	require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
	-- end, { silent = true })
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>", { desc = "Typescript: rename file and update imports" }) -- rename file and update imports
		keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>", { desc = "Typescript: organize imports" }) -- organize imports (not in youtube nvim video)
		keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>", { desc = "Typescript: remove unused variables" }) -- remove unused variables (not in youtube nvim video)
	end
	if client.name == "tailwindcss" then
		require("tailwindcss-colors").buf_attach(bufnr) --  for tailwindcss-colors highlight
	end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- 左边的图标
-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "  ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- 在neovim0.9下这个配置并不起作用(个人猜测是因为neovim0.9)
-- protocol.CompletionItemKind = {
-- 	"", -- Text
-- 	"", -- Method
-- 	"", -- Function
-- 	"", -- Constructor
-- 	"", -- Field
-- 	"", -- Variable
-- 	"", -- Class
-- 	"ﰮ", -- Interface
-- 	"", -- Module
-- 	"", -- Property
-- 	"", -- Unit
-- 	"", -- Value
-- 	"", -- Enum
-- 	"", -- Keyword
-- 	"﬌", -- Snippet
-- 	"", -- Color
-- 	"", -- File
-- 	"", -- Reference
-- 	"", -- Folder
-- 	"", -- EnumMember
-- 	"", -- Constant
-- 	"", -- Struct
-- 	"", -- Event
-- 	"ﬦ", -- Operator
-- 	"", -- TypeParameter
-- }

-- configure html server
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure typescript server with plugin
typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

-- configure css server
lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure xml server
lspconfig.lemminx.setup({})

-- configure emmet language server
-- lspconfig["emmet_ls"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
--   filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
-- })

-- configure lua server (with special settings)
-- lspconfig["sumneko_lua"].setup({ -- it's renamed to lua_ls
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
