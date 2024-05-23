-- Move between windows // Replaced by tmux-navigator
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below window" })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above window" })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows
vim.keymap.set("n", "<C-Up>", "<Cmd>resize -2<CR>", { desc = "Resize window up" })
vim.keymap.set("n", "<C-Down>", "<Cmd>resize +2<CR>", { desc = "Resize window down" })
vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Resize window left" })
vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Resize window right" })

-- Split windows
vim.keymap.set("n", "|", "<Cmd>vsplit<CR>", { desc = "Vertical Split" })
vim.keymap.set("n", "\\", "<Cmd>split<CR>", { desc = "Horizontal Split" })

-- Standard keymaps
vim.keymap.set("n", "<Leader>w", "<Cmd>w<CR>", { desc = "Save" })
vim.keymap.set("n", "<Leader>q", "<Cmd>confirm q<CR>", { desc = "Close Window" })
vim.keymap.set("n", "<Leader>Q", "<Cmd>confirm qall<CR>", { desc = "Exit Neovim" })
vim.keymap.set("n", "U", "<Cmd>redo<CR>", { desc = "Redo" }) -- Overwrite default "undo line"

-- Buffers
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>b#<CR>", { desc = "Switch to last buffer" })

-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear Search Highlight" })

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- UI - Toggle gutter, line numbers, and signcolumn
vim.keymap.set("n", "<leader>un", function()
	vim.wo.number, vim.wo.relativenumber = not vim.wo.number, not vim.wo.relativenumber
	vim.notify("Line numbers " .. (vim.wo.number and "enabled" or "disabled"))
end, { noremap = true, silent = true, desc = "Toggle Line Numbers" })

vim.keymap.set("n", "<leader>us", function()
	vim.wo.signcolumn = vim.wo.signcolumn == "no" and "yes" or "no"
	vim.notify("Signcolumn " .. (vim.wo.signcolumn == "yes" and "enabled" or "disabled"))
end, { noremap = true, silent = true, desc = "Toggle Signcolumn" })

vim.keymap.set("n", "<leader>ug", function()
	vim.wo.number, vim.wo.relativenumber = not vim.wo.number, not vim.wo.relativenumber
	vim.wo.signcolumn = vim.wo.signcolumn == "no" and "yes" or "no"
	vim.notify("Gutter " .. (vim.wo.signcolumn == "yes" and "enabled" or "disabled"))
end, { noremap = true, silent = true, desc = "Toggle Gutter" })
