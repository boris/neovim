return {
  -- GitHub Copilot
  { "github/copilot.vim" },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {},
  },

  -- Parrot.nvim for AI prompts
  {
    "frankroeder/parrot.nvim",
    dependencies = {
      "ibhagwan/fzf-lua",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("parrot").setup({
        providers = {
          gemini = {
            api_key = os.getenv "GEMINI_API_KEY",
          },
          openai = {
            api_key = os.getenv "OPENAI_API_KEY",
          },
        },
      })
    end,
  },
}
