return {
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
        yaml = true,
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
      },
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
        desc = "Toggle Copilot Chat",
        mode = { "n", "v" },
      },
    },
  },
  {
    "johnseth97/codex.nvim",
    lazy = true,
    cmd = { "Codex", "CodexToggle" },
    keys = {
      {
        "<leader>cc",
        function()
          require("codex").toggle()
        end,
        desc = "Toggle Codex popup",
      },
    },
    opts = {
      keymaps = {
        toggle = nil,
        quit = "<C-q>",
      },
      border = "rounded",
      width = 0.8,
      height = 0.8,
      model = nil,
      autoinstall = true,
    },
  },
}
