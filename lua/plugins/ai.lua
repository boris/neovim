return {
  -- Github Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
      suggestion = {
        enabled = not vim.g.ai_cmp,
        auto_trigger = true,
        hide_during_completion = vim.g.ai_cmp,
        keymap = {
          accept = "<C-j>",
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
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
