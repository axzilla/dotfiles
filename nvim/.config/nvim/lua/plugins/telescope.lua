return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			-- NOTE: On M1 Macbook: cd ~/.local/share/nvim/lazy/telescope-fzf-native.nvim && make clean && arch -arm64 make
		},
		"nvim-tree/nvim-web-devicons",
		build = "make",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")

		-- Base Configuration
		local config = {
			pickers = {
				live_grep = {
					file_ignore_patterns = { "node_modules", ".git", ".venv" },
					additional_args = function(_)
						return { "--hidden" }
					end,
				},
				find_files = {
					file_ignore_patterns = { "node_modules", ".git", ".venv" },
				},
			},
			defaults = {
				path_display = { filename_first = { reverse_directories = false } },
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.50,
					},
					width = 0.90,
					height = 0.80,
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["\\"] = actions.select_horizontal,
						["|"] = actions.select_vertical,
					},
					n = {
						["\\"] = actions.select_horizontal,
						["|"] = actions.select_vertical,
					},
				},
			},
		}

		telescope.setup(config)
		telescope.load_extension("fzf")

		-- Keymaps
		local function map(key, action, desc)
			vim.keymap.set("n", "<leader>" .. key, action, { desc = desc })
		end

		-- File pickers
		map("ff", builtin.find_files, "Find Files")
		map("fF", function()
			builtin.find_files({ hidden = true })
		end, "Find Hidden Files")
		map("fo", builtin.oldfiles, "Find Oldfiles")

		-- Search pickers
		map("fw", builtin.grep_string, "Find Word")
		map("fg", builtin.live_grep, "Find Grep")
		map("f/", function()
			builtin.live_grep({ grep_open_files = true })
		end, "Find in Open Files")

		-- LSP pickers
		map("fs", builtin.lsp_document_symbols, "Find Document Symbols")
		map("fS", builtin.lsp_workspace_symbols, "Find Workspace Symbols")
		map("fd", builtin.diagnostics, "Find Diagnostics")

		-- Other pickers
		map("fh", builtin.help_tags, "Find Help")
		map("fk", builtin.keymaps, "Find Keymaps")
		map("fr", builtin.resume, "Find Last Results")
	end,
}
