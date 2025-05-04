vim.g.mapleader = " "
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
vim.opt.listchars = { tab = '▸ ', trail = '·', extends = '»', precedes = '«', eol = '↲' }

-- Terraform
vim.g.terraform_align = 1
vim.g.terraform_fmt_on_save = 1

-- Airline
vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = 'deus'

-- Copilot tab override
vim.g.copilot_no_tab_map = true

