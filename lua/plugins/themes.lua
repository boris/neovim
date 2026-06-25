return {
  {
    'gbprod/nord.nvim',
    lazy = false,
    priority = 998,
    config = function()
        require('nord').setup()
        vim.cmd.colorscheme('nord')
    end
  },
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 999,
    config = function()
        vim.g.everforest_enable_italic = true
        vim.cmd.colorscheme('everforest')
    end
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vscode").setup {
        style = "dark",
        transparent = true,
        italic_comments = true,
      }
      vim.cmd.colorscheme("vscode")
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

