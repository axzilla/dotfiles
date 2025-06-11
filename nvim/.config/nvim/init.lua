-- Check if running in VSCode
if vim.g.vscode then

else
    -- ========== Full Neovim Config ==========
    require("config.options")
    require("config.lazy")
    require("config.keymaps")
    require("config.autocmd")
end
