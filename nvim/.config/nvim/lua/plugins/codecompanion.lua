return {
	"olimorris/codecompanion.nvim",
	enabled = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"j-hui/fidget.nvim",
	},
	config = function()
		-- Configure the codecompanion plugin
		require("codecompanion").setup({
			-- Define interaction strategies with different adapters
			strategies = {
				chat = {
					adapter = "copilot", -- Use Copilot for chat interactions
				},
				inline = {
					adapter = "copilot", -- Use Copilot for inline code suggestions
				},
			},
			-- Configure the adapters
			adapters = {
				copilot = function()
					-- Extend the default Copilot adapter with custom configuration
					return require("codecompanion.adapters").extend("copilot", {
						schema = {
							model = {
								default = "claude-3.7-sonnet", -- Set Claude 3.7 Sonnet as the default model
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
		require("plugins.codecompanion.spinner"):init()
	end,
}
