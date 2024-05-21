local M = {}

-- Initial states
M.lualine_active = true
M.barbecue_active = true
M.bufferline_active = true
M.treesitter_context_active = true
M.sidebar_active = true

function M.initialize()
	vim.defer_fn(function()
		-- Initialize lualine
		if not M.lualine_active then
			---@diagnostic disable-next-line: missing-parameter
			require("lualine").hide()
			vim.o.laststatus = 0
		else
			vim.o.laststatus = 2
		end

		-- Initialize barbecue
		if not M.barbecue_active then
			require("barbecue.ui").toggle()
		end

		-- Initialize bufferline
		if not M.bufferline_active then
			vim.opt.showtabline = 0
		else
			vim.opt.showtabline = 2
		end

		-- Initialize treesitter context
		if not M.treesitter_context_active then
			require("treesitter-context").disable()
		else
			require("treesitter-context").enable()
		end

		-- Set up autocommands for file-specific settings
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
			callback = function()
				-- Only apply settings if the buffer has a file and is not the Alpha dashboard
				if vim.fn.empty(vim.fn.expand("%:t")) == 0 and vim.bo.filetype ~= "alpha" then
					-- Apply sidebar settings
					vim.wo.number = M.sidebar_active
					vim.wo.relativenumber = M.sidebar_active
					vim.wo.foldcolumn = M.sidebar_active and "1" or "0"
					vim.wo.signcolumn = M.sidebar_active and "yes" or "no"
				end
			end,
		})
	end, 100) -- Delay of 100ms to ensure all plugins are loaded
end

function M.toggle_lualine()
	if M.lualine_active then
		require("lualine").hide()
		vim.o.laststatus = 0
	else
		require("lualine").setup({})
		vim.o.laststatus = 2
	end
	M.lualine_active = not M.lualine_active
end

function M.toggle_barbecue()
	require("barbecue.ui").toggle()
	M.barbecue_active = not M.barbecue_active
end

function M.toggle_bufferline()
	local current_value = vim.opt.showtabline:get()
	local new_value = current_value == 0 and 2 or 0
	vim.opt.showtabline = new_value
	M.bufferline_active = new_value == 2
end

function M.toggle_treesitter_context()
	if M.treesitter_context_active then
		require("treesitter-context").disable()
	else
		require("treesitter-context").enable()
	end
	M.treesitter_context_active = not M.treesitter_context_active
end

function M.toggle_sidebar()
	M.sidebar_active = not M.sidebar_active
	local new_value = M.sidebar_active and "yes" or "no"
	local fold_value = M.sidebar_active and "1" or "0"

	-- Apply the new settings to all open windows
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.fn.empty(vim.fn.expand("%:t", nil, buf)) == 0 and vim.bo[buf].filetype ~= "alpha" then
			vim.api.nvim_win_set_option(win, "number", M.sidebar_active)
			vim.api.nvim_win_set_option(win, "relativenumber", M.sidebar_active)
			vim.api.nvim_win_set_option(win, "foldcolumn", fold_value)
			vim.api.nvim_win_set_option(win, "signcolumn", new_value)
		end
	end
end

function M.toggle_zen_mode()
	-- Determine if Zen mode is active by checking if all components are off
	local zen_mode_active = not M.lualine_active
		and not M.barbecue_active
		and not M.bufferline_active
		and not M.treesitter_context_active
		and not M.sidebar_active

	if zen_mode_active then
		-- If Zen mode is active, turn everything on
		if not M.lualine_active then
			M.toggle_lualine()
		end
		if not M.barbecue_active then
			M.toggle_barbecue()
		end
		if not M.bufferline_active then
			M.toggle_bufferline()
		end
		if not M.treesitter_context_active then
			M.toggle_treesitter_context()
		end
		if not M.sidebar_active then
			M.toggle_sidebar()
		end
	else
		-- If Zen mode is not active, turn everything off
		if M.lualine_active then
			M.toggle_lualine()
		end
		if M.barbecue_active then
			M.toggle_barbecue()
		end
		if M.bufferline_active then
			M.toggle_bufferline()
		end
		if M.treesitter_context_active then
			M.toggle_treesitter_context()
		end
		if M.sidebar_active then
			M.toggle_sidebar()
		end
	end
end

vim.keymap.set("n", "<leader>uu", M.toggle_zen_mode, { noremap = true, silent = true, desc = "Toggle Zen Mode" })
vim.keymap.set("n", "<leader>us", M.toggle_sidebar, { noremap = true, silent = true, desc = "Toggle Sidebar" })

return M
