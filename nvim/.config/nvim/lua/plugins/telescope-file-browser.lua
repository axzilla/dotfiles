return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup()
        require("telescope").load_extension "file_browser"

        vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>", { noremap = true, desc = "Open file browser" })
    end
}
