-- Better navigation in wrapped lines
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "j", "gj")

-- Better indent
local n_opts = { silent = true, noremap = true }
vim.keymap.set("v", "<", "<gv", n_opts)
vim.keymap.set("v", ">", ">gv", n_opts)
vim.keymap.set("n", "<", "<<", n_opts)
vim.keymap.set("n", ">", ">>", n_opts)

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
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
vim.keymap.set("v", "<A-j>", ":'<,'>move '>+1<CR>gv=gv", { desc = "Move Down", silent = true })
vim.keymap.set("v", "<A-k>", ":'<,'>move '<-2<CR>gv=gv", { desc = "Move Up", silent = true })

-- Toggle Whitespace Chars
local function toggle_listchars()
	if vim.opt.list:get() then
		vim.opt.list = false
		vim.notify("Listchars disabled")
	else
		vim.opt.list = true
		vim.wo.listchars = "space:·,tab:→ "
		vim.notify("Listchars enabled")
	end
end
vim.keymap.set("n", "<leader>uw", toggle_listchars, { desc = "Toggle Whitespace Chars" })

-- Toggle Colorcolumns
local function toggle_colorcolumn()
	if vim.wo.colorcolumn == "" then
		-- First Option: only 100
		vim.wo.colorcolumn = "100"
		vim.notify("ColorColumn: 100")
	elseif vim.wo.colorcolumn == "100" then
		-- Second Option: 80 and 100
		vim.wo.colorcolumn = "80,100"
		vim.notify("ColorColumn: 80,100")
	else
		-- Off
		vim.wo.colorcolumn = ""
		vim.notify("ColorColumn disabled")
	end
end
vim.keymap.set("n", "<leader>um", toggle_colorcolumn, { desc = "Toggle ColorColumn" })
