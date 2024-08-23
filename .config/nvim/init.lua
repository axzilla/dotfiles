require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.autocmd")

local function install_latest_templ()
	vim.fn.system("go install github.com/a-h/templ/cmd/templ@latest")
	if vim.v.shell_error ~= 0 then
		print("Failed to install templ. Make sure Go is installed and in your PATH.")
	else
		print("Successfully installed the latest version of templ.")
	end
end

vim.api.nvim_create_user_command("TemplInstallLatest", install_latest_templ, {})

-- Optional: Add a function to update Mason's knowledge of templ
local function update_mason_templ()
	local mason_registry = require("mason-registry")
	if mason_registry.is_installed("templ") then
		mason_registry.get_package("templ"):get_receipt():write({ version = "latest" })
		print("Updated Mason's templ package information.")
	else
		print("templ is not installed via Mason. Only the system-wide version was updated.")
	end
end

vim.api.nvim_create_user_command("TemplUpdateMason", update_mason_templ, {})
