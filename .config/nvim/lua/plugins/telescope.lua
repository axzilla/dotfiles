return {
	"nvim-telescope/telescope.nvim",
	-- INFO:  Use no branch to get the latest version (because filename_first is not working in 0.1.x)
	-- branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- INFO: On M1 Macbook, go to ~/.local/share/nvim/lazy/telescope-fzf-native.nvim
		-- and run make clean && arch -arm64 make.
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		build = "make",
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			pickers = {
				live_grep = {
					file_ignore_patterns = { "node_modules", ".git", ".venv" },
					additional_args = function(_)
						return { "--hidden" }
					end,
				},
				find_files = {
					file_ignore_patterns = { "node_modules", ".git", ".venv" },
					hidden = true,
				},
			},
			defaults = {
				path_display = {
					filename_first = { reverse_directories = false },
				},
				mappings = {
					i = {
						["<C-k>"] = require("telescope.actions").move_selection_previous,
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["\\"] = require("telescope.actions").select_horizontal,
						["|"] = require("telescope.actions").select_vertical,
					},
					n = {
						["\\"] = require("telescope.actions").select_horizontal,
						["|"] = require("telescope.actions").select_vertical,
					},
				},
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.50,
					},
					width = 0.90,
					height = 0.80,
				},
			},
		})

		require("telescope").load_extension("fzf")

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
		vim.keymap.set("n", "<leader>fF", function()
			builtin.find_files({ hidden = true, no_ignore = true })
		end, { desc = "Find All Files (+hidden)" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
		vim.keymap.set("n", "<leader>fH", builtin.highlights, { desc = "Find Highlights" })
		vim.keymap.set("n", "<leader>fb", builtin.builtin, { desc = "Find Builtins" })
		vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find Word" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find Grep" })
		vim.keymap.set("n", "<leader>fG", builtin.git_files, { desc = "Find Git Files" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find Diagnostics" })
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find Oldfiles" })
		vim.keymap.set("n", "<leader>fj", builtin.jumplist, { desc = "Find Jumplist" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
		vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Find Resume" })

		vim.keymap.set("n", "<leader>f/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "Find in Open Files" })

		vim.keymap.set("n", "<leader>fN", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Find Neovim Files" })

		vim.keymap.set("n", "<leader><leader>", function()
			builtin.buffers({ sort_mru = true, ignore_current_buffer = true })
		end, { desc = "Find Buffers" })

		vim.keymap.set("n", "<leader>fc", function()
			builtin.current_buffer_fuzzy_find({ previewer = false })
		end, { desc = "Find in Buffer (current)" })
	end,
}
