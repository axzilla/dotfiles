local o = vim.opt

o.autoread = true           -- automatically reload files when they change on disk // only works with `checktime` autocmd
o.termguicolors = true      -- enable 24-bit RGB color in the TUI
o.conceallevel = 2          -- hide conceal text // e.g. *bold* or _italic_
o.mousemoveevent = true     -- enable mouse support
o.clipboard = "unnamedplus" -- enable clipboard
o.cmdheight = 0             -- hide command line unless needed
o.colorcolumn = { 100 }     -- show color columns - multiple values possible (e.g. { 80, 100 })
o.cursorline = true         -- highlight the text line of the cursor
o.guicursor = ""            -- show thick cursor instead of '|'
o.ignorecase = true         -- case insensitive searching
o.mouse = "a"               -- enable mouse support
o.number = true             -- show numberline
o.relativenumber = true     -- show relative numberline
o.scrolloff = 5             -- lines of context while scrolling
o.expandtab = true          -- enable the use of space in tab
o.tabstop = 2               -- number of space in a tab
o.shiftwidth = 2            -- number of space inserted for indentation
o.signcolumn = "yes"        -- show sign column
o.smartcase = true          -- case sensitive searching
o.termguicolors = true      -- enable 24-bit RGB color in the TUI
o.timeoutlen = 300          -- shorten key timeout length a little bit for which-key
o.updatetime = 250          -- length of time to wait before triggering the plugin
o.wrap = false              -- disable line wrap
o.fillchars = { eob = " " } -- disable `~` on nonexistent lines // e.g beautify the gutter
