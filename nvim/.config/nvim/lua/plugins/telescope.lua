return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")

		local config = {
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
			pickers = {
				-- With preview (bottom)
				live_grep = {
					file_ignore_patterns = { "node_modules", ".git", ".venv" },
					additional_args = function(_)
						return { "--hidden" }
					end,
					layout_strategy = "vertical",
					layout_config = {
						width = 0.7,
						height = 0.9,
						preview_height = 0.4,
						prompt_position = "top",
						mirror = true,
					},
				},
				grep_string = {
					file_ignore_patterns = { "node_modules", ".git", ".venv" },
					additional_args = function(_)
						return { "--hidden" }
					end,
					layout_strategy = "vertical",
					layout_config = {
						width = 0.7,
						height = 0.9,
						preview_height = 0.4,
						prompt_position = "top",
						mirror = true,
					},
				},

				-- Ohne Preview (schmal)
				find_files = {
					previewer = false,
					file_ignore_patterns = { "node_modules", ".git", ".venv" },
					layout_config = { width = 0.5 },
				},
				oldfiles = {
					previewer = false,
					layout_config = { width = 0.5 },
				},
				buffers = {
					previewer = false,
					layout_config = { width = 0.5 },
				},
				help_tags = {
					previewer = false,
					layout_config = { width = 0.5 },
				},
				keymaps = {
					previewer = false,
					layout_config = { width = 0.5 },
				},
				diagnostics = {
					previewer = false,
					layout_config = { width = 0.5 },
				},
				lsp_document_symbols = {
					previewer = false,
					layout_config = { width = 0.5 },
				},
				lsp_workspace_symbols = {
					previewer = false,
					layout_config = { width = 0.5 },
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
		map("<leader>", function()
			builtin.buffers({ sort_mru = true, ignore_current_buffer = true })
		end, "Find Buffers")

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
