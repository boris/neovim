return {
  -- Github Copilot
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      auto_insert_mode = true,
      question_header = "  User ",
      answer_header = "  Copilot ",
      window = {
        border = "rounded",
        win_options = {
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual",
        },
        width = 0.4,
      }
    },
    cmd = "CopilotChat",
    keys = {
      {
        "<leader>aa",
        function()
          require("CopilotChat").toggle()
        end,
        desc = "Toggle Copilot Chat",
        mode = { "n", "v" },
      },
      {
        "<C-b>",
        function()
          require("CopilotChat").toggle()
        end,
        desc = "Toggle Copilot Chat (Ctrl-B)",
        mode = { "n", "v" },
      }
    },
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
