	-- for gpt nvim
return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  config = function()
    require("chatgpt").setup({
      -- setup OPENAI_API_KEY = "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",
      api_key_cmd = "echo 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",
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}