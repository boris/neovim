return {
  {
      'sainnhe/everforest',
      lazy = false,
      priority = 1000,
      config = function()
        vim.g.everforest_enable_italic = true
        vim.cmd.colorscheme('everforest')
      end
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

