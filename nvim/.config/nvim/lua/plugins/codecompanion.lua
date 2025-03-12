return {
	"olimorris/codecompanion.nvim",
	enabled = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"j-hui/fidget.nvim",
	},
	config = function()
		require("codecompanion").setup({
			strategies = {
				chat = {
					adapter = "copilot",
				},
				inline = {
					adapter = "copilot",
				},
			},
			adapters = {
				copilot = function()
					return require("codecompanion.adapters").extend("copilot", {
						schema = {
							model = {
								default = "claude-3.7-sonnet",
							},
						},
					})
				end,
			},
		})

		-- Set up keymaps with descriptive comments and the <leader>a prefix
		-- Define a wrapper function for setting keymaps
		-- @param mode: string|table - Mode short-name ("n", "i", "v", "x", etc.) or table of mode names
		-- @param lhs: string - Left-hand side of the mapping. The key(s) to be pressed
		-- @param rhs: string|function - Right-hand side of the mapping. The command or function to execute
		-- @param desc: string - Optional description for the mapping (for which-key and help)
		local function map(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, {
				noremap = true, -- Use non-recursive mapping
				silent = true, -- Don't echo commands to command line
				desc = desc, -- Add description for documentation/display
			})
		end

		-- Chat operations
		map("n", "<leader>ac", "<cmd>CodeCompanionChat<CR>", "Open AI Chat")
		map("v", "<leader>ac", "<cmd>CodeCompanionChat<CR>", "Open AI Chat")
		map("v", "<leader>ai", ":'<,'>CodeCompanion<CR>", "Start AI Inline Edit (Visual)")
		map("n", "<leader>aa", "<cmd>CodeCompanionActions<CR>", "Select AI Actions")
	end,
	init = function()
		vim.cmd([[cab cc CodeCompanion]])
		require("plugins.codecompanion.spinner"):init()
	end,
}
