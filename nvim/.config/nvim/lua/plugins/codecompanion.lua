return {
	"olimorris/codecompanion.nvim",
	enabled = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
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

		-- Keymaps setup with <leader>a prefix and English comments
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- Open AI Chat
		-- Opens the CodeCompanion chat window using Copilot
		keymap(
			"n",
			"<leader>ac",
			"<cmd>CodeCompanionChat<CR>",
			vim.tbl_extend("force", opts, { desc = "Open AI Chat" })
		)

		-- Close AI Chat
		-- Closes the CodeCompanion chat window
		keymap(
			"n",
			"<leader>aq",
			"<cmd>CodeCompanionChatClose<CR>",
			vim.tbl_extend("force", opts, { desc = "Close AI Chat" })
		)

		-- Toggle AI Chat
		-- Toggles the visibility of the CodeCompanion chat window
		keymap(
			"n",
			"<leader>at",
			"<cmd>CodeCompanionToggle<CR>",
			vim.tbl_extend("force", opts, { desc = "Toggle AI Chat" })
		)

		-- Start AI Inline Edit
		-- Starts inline editing with CodeCompanion using Copilot in normal mode
		keymap(
			"n",
			"<leader>ai",
			"<cmd>CodeCompanionInline<CR>",
			vim.tbl_extend("force", opts, { desc = "Start AI Inline Edit" })
		)
		-- Starts inline editing with CodeCompanion using Copilot on visual selection
		keymap(
			"v",
			"<leader>ai",
			":'<,'>CodeCompanionInline<CR>",
			vim.tbl_extend("force", opts, { desc = "Start AI Inline Edit (Visual)" })
		)

		-- Select AI Actions
		-- Opens the list of available CodeCompanion actions
		keymap(
			"n",
			"<leader>aa",
			"<cmd>CodeCompanionActions<CR>",
			vim.tbl_extend("force", opts, { desc = "Select AI Actions" })
		)

		-- AI Chat with Buffer Context
		-- Starts a chat with the context of the current buffer using Copilot
		keymap(
			"n",
			"<leader>ab",
			"<cmd>CodeCompanionChat Buffer<CR>",
			vim.tbl_extend("force", opts, { desc = "AI Chat with Buffer Context" })
		)
		-- Starts a chat with the context of the selected buffer text using Copilot
		keymap(
			"v",
			"<leader>ab",
			":'<,'>CodeCompanionChat Buffer<CR>",
			vim.tbl_extend("force", opts, { desc = "AI Chat with Selected Buffer Context" })
		)

		-- Open AI Prompt Library
		-- Opens the CodeCompanion prompt library for quick tasks
		keymap(
			"n",
			"<leader>ap",
			"<cmd>CodeCompanionPrompt<CR>",
			vim.tbl_extend("force", opts, { desc = "Open AI Prompt Library" })
		)

		-- Clear AI Chat Buffer
		-- Clears the current chat buffer in CodeCompanion
		keymap(
			"n",
			"<leader>ad",
			"<cmd>CodeCompanionChatClear<CR>",
			vim.tbl_extend("force", opts, { desc = "Clear AI Chat Buffer" })
		)

		-- Insert Slash Command in Chat (optional)
		-- Inserts a slash command in chat mode for quick actions
		keymap("i", "<C-s>", "/", vim.tbl_extend("force", opts, { desc = "Insert Slash Command in Chat" })) -- In Chat mode
	end,
}
