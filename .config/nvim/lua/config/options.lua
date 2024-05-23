local o = vim.opt

o.clipboard = "unnamedplus" -- enable clipboard
o.mousemoveevent = true
o.cmdheight = 0 -- hide command line unless needed
-- o.colorcolumn = { 100, 120 } -- show color columns
o.cursorline = true -- highlight the text line of the cursor
o.expandtab = true -- enable the use of space in tab
o.guicursor = "" -- show thick cursor instead of '|'
o.ignorecase = true -- case insensitive searching
o.mouse = "a" -- enable mouse support
o.number = true -- show numberline
o.relativenumber = true -- show relative numberline
o.scrolloff = 4 -- lines of context while scrolling
o.shiftwidth = 2 -- number of space inserted for indentation
o.signcolumn = "yes" -- show sign column
o.smartcase = true -- case sensitive searching
o.tabstop = 2 -- number of space in a tab
o.termguicolors = true -- enable 24-bit RGB color in the TUI
o.timeoutlen = 300 -- shorten key timeout length a little bit for which-key
o.updatetime = 250 -- length of time to wait before triggering the plugin
o.wrap = false -- disable line wrap
o.fillchars = { eob = " " } -- disable `~` on nonexistent lines
