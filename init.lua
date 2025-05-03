-- init.lua
vim.g.mapleader = " "
--vim.api.nvim_set_option('pastetoggle', '<F3>')
vim.opt.number = true
vim.opt.ruler = true
vim.opt.scrolloff = 5
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, 'CursorLine', { ctermbg = 0, fg = '#3b3b3b' })
vim.opt.colorcolumn = '80'
vim.api.nvim_set_hl(0, 'ColorColumn', { ctermbg = 0, fg = '#3b3b3b' })
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Automatically install lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    { "preservim/nerdtree" },
    { "github/copilot.vim" },
    { "ryanoasis/vim-devicons" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
    { "windwp/nvim-autopairs" },
    { "vim-airline/vim-airline" },
    { "vim-airline/vim-airline-themes" },
    { "tpope/vim-fugitive" },
    { "EdenEast/nightfox.nvim" },
    { "nvim-telescope/telescope.nvim", tag = "0.1.8",
       dependencies = { 
           "nvim-lua/plenary.nvim"
       }
    },
    { "nvim-treesitter/nvim-treesitter", build= ":TSUpdate" },
    { "startup-nvim/startup.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
        config = function()
            require "startup".setup()
        end
    },
    { 'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup({
                theme = 'hyper',
                config = {
                    week_header = {
                        enable = true,
                    },
                },
            })
        end,
        dependecies = { {'nvim-tree/nvim-web-devicons'}}
    },
    { "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        opts = {},
    },
    { "romanaverin/charleston.nvim",
        name = "charleston",
        priority = 1000,
    },
    { "frankroeder/parrot.nvim",
        dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
        opts = {},
        config = function()
            require("parrot").setup({
                providers = {
                    gemini = {
                        api_key = os.getenv "GEMINI_API_KEY",
                    },
                    openai = {
                        api_key = os.getenv "OPENAI_API_KEY",
                    },
                }
            })
        end,
    }

-- end of plugins
}
local opts = {}

require("lazy").setup(plugins, opts)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- Treesitter
local config = require('nvim-treesitter.configs')
config.setup {
  ensure_installed = {"lua", "yaml", "json", "dockerfile", "python", "hcl"},
  highlight = { enable = true },
  indent = { enable = true },
}

-- NERDTree configuration
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- Close NERDTree if it's the last window open
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.fn.winnr("$") == 1 and vim.bo.filetype == "nerdtree" then
      vim.cmd("q")
    end
  end
})

-- LSP settings
local nvim_lsp = require('lspconfig')

-- Enable the following language servers
local servers = { 
	'dockerls',
	'jsonnet_ls',
	'pyre',
    'yamlls'
}

-- Loop through and setup each server
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- nvim-cmp setup
local cmp = require'cmp'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<C-k>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
  }
end

-- Customization
vim.api.nvim_create_autocmd("FileType", {
    pattern = "yaml",
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
        vim.opt.expandtab = true
    end
})

-- Toggle invisible characters
vim.api.nvim_set_keymap('n', '<C-i>', ':set list!<CR>', { noremap = true, silent = true })
vim.opt.listchars = { tab = '▸ ', trail = '·', extends = '»', precedes = '«', eol = '↲' }

-- Copilot custom keybindings
vim.keymap.set('i', '<C-j>', 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

-- Autopairs configuration
require('nvim-autopairs').setup{}

-- Theme configuration
vim.cmd('colorscheme charleston')
vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = 'deus'

-- Terraform
vim.g.terraform_align = 1
vim.g.terraform_fmt_on_save = 1
