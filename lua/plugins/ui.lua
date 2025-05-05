return {
  { "ryanoasis/vim-devicons" },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("dashboard").setup({
        theme = "hyper",
        config = {
          week_header = { enable = true },
        },
      })
    end,
  },
  {
    "startup-nvim/startup.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
      require("startup").setup()
    end,
  },
  -- Indent guides like VSCode
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  -- Modern file explorer (alternative to NERDTree)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            visible = false,  -- default: don’t show hidden files
            hide_dotfiles = true,
            hide_gitignored = true,
          },
        },
        window = {
          position = "left",
          width = 30,
          mappings = {
            ["<space>"] = "toggle_hidden",
          }
        },
      })
    end,
    keys = {
      {
        "<C-n>",
        function()
          require("neo-tree.command").execute({ toggle = true })
        end,
        desc = "Toggle NeoTree",
      },
    },
  },
--  -- Which key
--  {
--    "folke/which-key.nvim",
--    event = "VeryLazy",
--    opts = {
--      plugins = {
--        spelling = {
--          enabled = true,
--          suggestions = 28,
--        }
--      }
--    },
--    keys = {
--      {
--        "<leader>?",
--        function()
--          require("which-key").show({ global = false })
--        end,
--        desc = "Buffer Local Keymaps (which-key)",
--      },
--    },
--  }
}
