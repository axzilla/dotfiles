-- General
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move window left' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move window down' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move window up' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move window right' })

-- Neo-tree // TODO: Back to buffer doesn't work!
-- vim.keymap.set('n', '<leader>o', function()
--   if vim.bo.filetype == "neotree" then
--     vim.cmd("wincmd p")
--   else
--     vim.cmd("Neotree focus")
--   end
--   print("Hello")
-- end, { desc = 'Toggle Explorer Focus' })
--
-- -- Buffer
-- vim.keymap.set('n', '[b', '<Cmd>bprevious<CR>', { desc = 'Prev buffer' })
-- vim.keymap.set('n', ']b', '<Cmd>bnext<CR>', { desc = 'Next buffer' })
