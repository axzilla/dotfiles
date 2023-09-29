return {
    -- 'navarasu/onedark.nvim',
    -- priority = 1000,
    -- config = function()
    --     require('onedark').setup {
    --         style = 'darker'
    --     }
    --     require('onedark').load()
    -- end

    -- add gruvbox
    { "ellisonleao/gruvbox.nvim" },
    -- Configure LazyVim to load gruvbox
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "gruvbox",
        },
    },
}
