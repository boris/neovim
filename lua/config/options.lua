vim.opt.number = true
vim.opt.ruler = true
vim.opt.scrolloff = 5
vim.opt.cursorline = true
--vim.api.nvim_set_hl(0, 'CursorLine', { ctermbg = 0, fg = '#3b3b3b' })
vim.opt.colorcolumn = '80'
vim.api.nvim_set_hl(0, 'ColorColumn', { ctermbg = 0, fg = '#3b3b3b' })
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.listchars = { tab = '▸ ', trail = '·', extends = '»', precedes = '«', eol = '↲' }

-- Terraform
vim.g.terraform_align = 1
vim.g.terraform_fmt_on_save = 1

-- Copilot tab override
vim.g.copilot_no_tab_map = true
vim.opt.splitright = true

-- Which key
-- vim.cmd([[autocmd VimEnter * WhichKey <leader>]])
-- vim.keymap.set("n", "<leader>?", "<cmd>WhichKey<cr>", { desc = "Show all mappings" })
