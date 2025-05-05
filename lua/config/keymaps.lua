local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

--vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-i>', ':set list!<CR>', { noremap = true, silent = true })

-- Copilot Accept
vim.keymap.set('i', '<C-j>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})

-- Which key plugin
-- Following code is just an example
-- local wk = require("which-key")
-- 
-- wk.register({
--   ["<leader>f"] = {
--     name = "+find",
--     fg = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Live Grep" },
--     ff = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find Files" },
--   },
--   ["<leader>a"] = {
--     name = "+ai",
--     a = { function() require("CopilotChat").toggle() end, "Toggle Copilot Chat" },
--   },
-- })

