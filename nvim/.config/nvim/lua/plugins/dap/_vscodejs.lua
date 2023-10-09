local M = {}

M.setup = function()
    require('dap-vscode-js').setup {
        debugger_path = vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug',
        adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
    }

    for _, language in ipairs { 'typescript', 'javascript' } do
        require('dap').configurations[language] = {
            -- attach to a node process that has been started with
            -- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
            -- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
            {
                -- use nvim-dap-vscode-js's pwa-node debug adapter
                type = 'pwa-node',
                -- attach to an already running node process with --inspect flag
                -- default port: 9222
                request = 'attach',
                -- allows us to pick the process using a picker
                processId = require('dap.utils').pick_process,
                -- name of the debug action you have to select for this config
                name = 'Attach debugger to existing `node --inspect` process',
                -- for compiled languages like TypeScript or Svelte.js
                sourceMaps = true,
                -- resolve source maps in nested locations while ignoring node_modules
                resolveSourceMapLocations = {
                    '${workspaceFolder}/**',
                    '!**/node_modules/**',
                },
                -- path to src in vite based projects (and most other projects as well)
                cwd = '${workspaceFolder}',
                -- we don't want to debug code inside node_modules, so skip it!
                skipFiles = {
                    '${workspaceFolder}/node_modules/**/*.js',
                    '${workspaceFolder}/packages/**/node_modules/**/*.js',
                    '${workspaceFolder}/packages/**/**/node_modules/**/*.js',
                    '<node_internals>/**',
                    'node_modules/**',
                },
            },
            -- only if language is javascript, offer this debug action
            language == 'javascript'
            and {
                -- use nvim-dap-vscode-js's pwa-node debug adapter
                type = 'pwa-node',
                -- launch a new process to attach the debugger to
                request = 'launch',
                -- name of the debug action you have to select for this config
                name = 'Launch file in new node process',
                -- launch current file
                program = '${file}',
                cwd = '${workspaceFolder}',
            }
            or nil,
        }
    end
end

return M
