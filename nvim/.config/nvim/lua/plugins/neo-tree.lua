return {
	enabled = false,
	cond = true,
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			window = {
				mappings = {
					["<space>"] = "none", -- disable space for neo-tree "toggle_node" and use space as normal leader key
					["l"] = "open",
					["h"] = "close_node",
				},
				width = 30,
			},
			filesystem = {
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
				commands = {
					-- Add trash command
					trash = function(state)
						local inputs = require("neo-tree.ui.inputs")
						local path = state.tree:get_node().path
						local msg = "Are you sure you want to trash " .. path
						inputs.confirm(msg, function(confirmed)
							if not confirmed then
								return
							end
							vim.fn.system({ "trash", vim.fn.fnameescape(path) })
							require("neo-tree.sources.manager").refresh(state.name)
						end)
					end,
				},
				window = {
					mappings = {
						-- Linux: ~/.local/share/Trash/
						-- macOS: ~/.Trash/
						-- Windows: C:\$Recycle.Bin\
						["d"] = "trash", -- Move to system trash
						["D"] = "delete", -- Default delete (rm -rf)
					},
				},
			},
		})
		vim.keymap.set("n", "<Leader>e", "<Cmd>Neotree toggle<CR>", { desc = "Toggle Neotree" })
		vim.keymap.set("n", "<Leader>o", function()
			if vim.bo.filetype == "neo-tree" then
				vim.cmd.wincmd("p")
			else
				vim.cmd("Neotree focus")
			end
		end, { desc = "Toggle Neotree Focus" })
		-- Update Git status after closing LazyGit
		vim.api.nvim_create_autocmd("TermClose", {
			pattern = "*lazygit",
			callback = function()
				if package.loaded["neo-tree.sources.git_status"] then
					require("neo-tree.sources.git_status").refresh()
				end
			end,
		})
	end,
}
