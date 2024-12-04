-- Move between windows // INFO: tmux-navigator use this as well
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

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
vim.keymap.set("n", "U", "<Cmd>redo<CR>", { desc = "Redo" }) -- INFO: Overwrites default "undo line"

-- Commenting
vim.keymap.set("n", "<leader>/", "gcc", { remap = true, desc = "Toggle Comment Line" })
vim.keymap.set("x", "<leader>/", "gc", { remap = true, desc = "Toggle Comment Block" })

-- Buffers
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>b#<CR>", { desc = "Last buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bD", "<cmd>%bd|e#|bd#<cr>", { desc = "Delete Other Buffers" })

-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear Search Highlight" })

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
