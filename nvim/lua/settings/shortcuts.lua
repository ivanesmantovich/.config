-- TODO: Переделать шорткаты
-- Sorry, not sorry
vim.keymap.set('n', '<C-a>', '^')
vim.keymap.set('n', '<C-e>', '$')
-- Paste without yanking
vim.keymap.set('x', 'p', 'P')
-- Continuous Indentation
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
-- Move to Split
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
-- Create Split
vim.keymap.set('n', '<C-M-h>', '<C-w>v')
vim.keymap.set('n', '<C-M-j>', '<C-w>s')
vim.keymap.set('n', '<C-M-k>', '<C-w>s')
vim.keymap.set('n', '<C-M-l>', '<C-w>v')
-- Close Split
vim.keymap.set('n', '<C-w>', '<C-w>q', {nowait = true})
-- Telescope
local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>r', telescope_builtin.resume, {})
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})
vim.keymap.set('n', 'gd', telescope_builtin.lsp_definitions, {}) -- To go back C-t may be useful! (go back in Tag Stack)
vim.keymap.set('n', 'gr', telescope_builtin.lsp_references, {})
-- LazyGit
vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>', {})
