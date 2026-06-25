return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup {
        ensure_installed = { "lua", "yaml", "json", "dockerfile", "python", "hcl", "go" },
        highlight = { enable = true },
        indent = { enable = true },
      }
    end
  }
}
