-- 这个是 基本的lazy插件配置文件
return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use

  -- vs-code like icons
  "nvim-tree/nvim-web-devicons",
  -- "bluz71/vim-nightfly-guicolors",
  -- "rebelot/kanagawa.nvim",
  -- "gruvbox-community/gruvbox",
  -- "sainnhe/gruvbox-material",
  -- "folke/tokyonight.nvim",
  -- { "catppuccin/nvim", as = "catppuccin" },
  -- { "rose-pine/neovim", as = "rose-pine" },
  -- {
  -- 	"svrana/neosolarized.nvim",
  -- 	dependencies = { "tjdevries/colorbuddy.nvim" },
  -- },
  "RRethy/nvim-base16",
  "goolord/alpha-nvim",
  -- maximizes and restores current window
  {
    "szw/vim-maximizer",
    config = function() end,
  },

  -- tmux & split window navigation
  -- <C+hjkl> to navigate between panes
  "christoomey/vim-tmux-navigator",

  -- essential plugins
  -- add, delete, change surroundings (it's awesome)
  -- cheatsheet ysw" ds" cs"'
  "tpope/vim-surround",

  --  replace with register contents using motion (gr + motion)
  "vim-scripts/ReplaceWithRegister",

  -- -- commenting with gc
  -- -- cheatsheet gcc (comment or uncomment line), gc8j comment 8 lines
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- file explorer -- separated
  -- "nvim-tree/nvim-tree.lua",

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
  },

  -- indent lines 缩进的线
  "lukas-reineke/indent-blankline.nvim",

  -- bufferline -- not use
  -- { "akinsho/bufferline.nvim", tag = "v3.*", dependencies = "nvim-tree/nvim-web-devicons" },

  -- Fuzzy Finder (files, lsp, etc)
  { "nvim-telescope/telescope.nvim",            branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  -- {
  --   'nvim-telescope/telescope-fzf-native.nvim',
  --   -- NOTE: If you are having trouble with this installation,
  --   --       refer to the README for telescope-fzf-native for more instructions.
  --   build = 'make',
  --   cond = function()
  --     return vim.fn.executable 'make' == 1
  --   end,
  -- },
  -- { "nvim-telescope/telescope-media-files.nvim" }, -- media files previewer
  { "ThePrimeagen/harpoon" },

  -- autocompletion
  "hrsh7th/nvim-cmp",  -- completion plugin
  "hrsh7th/cmp-buffer", -- source for text in buffer
  "hrsh7th/cmp-path",  -- source for file system paths

  -- snippets
  "L3MON4D3/LuaSnip",            -- snippet engine
  "saadparwaiz1/cmp_luasnip",    -- for autocompletion
  "rafamadriz/friendly-snippets", -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  "williamboman/mason.nvim",          -- in charge of managing lsp servers, linters & formatters
  "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig

  -- formatting & linting
  "jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
  "jayp0521/mason-null-ls.nvim",    -- bridges gap b/w mason & null-ls

  -- colorized -- separated
  -- "norcalli/nvim-colorizer.lua",

  -- auto closing
  "windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...

  -- lsp
  -- configuring lsp servers
  "neovim/nvim-lspconfig", -- easily configure language servers
  "hrsh7th/cmp-nvim-lsp", -- for autocompletion
  -- lsp saga Neovim lsp enhance  -- separated
  -- {
  --   "glepnir/lspsaga.nvim",
  --   event = "LspAttach",
  --   dependencies = {
  --     { "nvim-tree/nvim-web-devicons" },
  --     --Please make sure you install markdown and markdown_inline parser
  --     { "nvim-treesitter/nvim-treesitter" },
  --   },
  -- },

  -- { "glepnir/lspsaga.nvim", branch = "main" }, -- enhanced lsp uis
  "jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
  "onsails/lspkind.nvim",              -- vs-code like icons for autocompletion
  "RRethy/vim-illuminate",             -- highlighting other uses of the word under the cursor using

  -- -- treesitter configuration -- separated
  "windwp/nvim-ts-autotag",
  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag", -- autoclose tags
    },
    build = ":TSUpdate",
  },
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	build = function()
  -- 		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
  -- 		ts_update()
  -- 	end,
  --    dependencies = {
  --       "windwp/nvim-ts-autotag", -- autoclose tags
  --    }
  -- },

  "folke/lsp-colors.nvim", -- lsp diagnostics colors
  -- "folke/todo-comments.nvim", -- separated

  -- git integration -- separated
  -- "lewis6991/gitsigns.nvim", -- show line modifications on left hand side
  -- "dinhhuy258/git.nvim", -- For git blame & brows
  -- "tpope/vim-fugitive",

  -- -- for tailwindcss-colors highlight -- separated
  -- {
  -- 	"themaxmarchuk/tailwindcss-colors.nvim",
  -- 	-- load only on require("tailwindcss-colors")
  -- 	module = "tailwindcss-colors",
  -- 	-- run the setup function after plugin is loaded
  -- 	config = function()
  -- 		-- pass config options here (or nothing to use defaults)
  -- 		require("tailwindcss-colors").setup()
  -- 	end,
  -- },

  -- image preview ( currently not working )
  -- use {'edluffy/hologram.nvim'}
  -- "wfxr/minim
}
