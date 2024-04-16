return {
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
				},
				width = 30,
			},
			filesystem = {
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
			event_handlers = {
				{
					event = "file_opened",
					handler = function(file_path)
						-- auto close
						-- vimc.cmd("Neotree close")
						-- OR
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		})

		vim.keymap.set("n", "<Leader>ee", "<Cmd>Neotree toggle<CR>", { desc = "Toggle Neotree (Buffer)" })
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
