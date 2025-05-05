return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha", -- or: latte, frappe, macchiato, mocha
      transparent_background = false,
      integrations = {
        lualine = true,
        treesitter = true,
        telescope = true,
        which_key = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
      },
    },
    config = function()
      vim.cmd("colorscheme catppuccin-frappe")
    end,
  },
  -- Statusline with theme support
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup {
        options = {
          theme = "nord",
          section_separators = "",
          component_separators = "|",
        },
      }
    end,
  },
}

