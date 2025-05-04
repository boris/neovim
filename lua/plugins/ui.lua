return {
  { "preservim/nerdtree" },
  { "ryanoasis/vim-devicons" },
  { "vim-airline/vim-airline" },
  { "vim-airline/vim-airline-themes" },
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
}
