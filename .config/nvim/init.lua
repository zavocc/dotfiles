--[[-----------------------------------------------------------------------------------
Core settings for neovim
-----------------------------------------------------------------------------------]]--

-- Number and cursorline
vim.opt.number = true
vim.opt.cursorline = true

-- Tab to spaces
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- Disable text wrapping so I can work with small windows
vim.opt.wrap = false

--[[-----------------------------------------------------------------------------------
Keymaps
-----------------------------------------------------------------------------------]]--

-- Terminal mode "Esc" to go back to normal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Make it easier to resize panes
-- Normally I would use the default CTRL-W + and CTRL-W -, but it takes more keypresses
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>')

-- Initiate plugins
require("plugins")
