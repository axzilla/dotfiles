-- Move between windows
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to below window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to above window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Resize windows
vim.keymap.set('n', '<C-Up>', '<Cmd>resize -2<CR>', { desc = 'Resize window up' })
vim.keymap.set('n', '<C-Down>', '<Cmd>resize +2<CR>', { desc = 'Resize window down' })
vim.keymap.set('n', '<C-Left>', '<Cmd>vertical resize -2<CR>', { desc = 'Resize window left' })
vim.keymap.set('n', '<C-Right>', '<Cmd>vertical resize +2<CR>', { desc = 'Resize window right' })

-- Standard keymaps
vim.keymap.set('n', '<Leader>w', '<Cmd>w<CR>', { desc = 'Save' })
vim.keymap.set('n', '<Leader>q', '<Cmd>confirm q<CR>', { desc = 'Quit Window' })
vim.keymap.set('n', '<Leader>Q', '<Cmd>confirm qall<CR>', { desc = 'Exit Neovim' })

-- Clear search highlight
vim.keymap.set('n', '<Leader>s', '<Cmd>nohlsearch<CR>', { desc = 'Clear Search Highlight' })
