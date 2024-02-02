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

-- NERDTree
vim.keymap.set('n', '<C-n>', ':NERDTreeToggle<CR>')

-- Make it easier to resize panes
-- Normally I would use the default CTRL-W + and CTRL-W -, but it takes more keypresses
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>')

--[[-----------------------------------------------------------------------------------
Plugins!
-----------------------------------------------------------------------------------]]--

-- Plugins setup
-- Check if we have git installed
if vim.fn.executable("git") == 0 then
  print("Git not found!")
  return
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Lazy load plugins
-- Parameters are table.... interesting
-- https://stackoverflow.com/questions/57792137/lua-functions-how-to-use-tables-as-function-arguments-and-self-document-the-cod
require("lazy").setup{
    "preservim/nerdtree",
    "tpope/vim-sleuth",
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",
    "nvim-lualine/lualine.nvim",
    --[[ for barbar.nvim icons ]]--
    "nvim-tree/nvim-web-devicons",
    --[[ for NERDtree ]]--
    "ryanoasis/vim-devicons",
    "romgrk/barbar.nvim",
    "chrisbra/changesPlugin",
    "ntpeters/vim-better-whitespace",
    "github/copilot.vim",
    "folke/tokyonight.nvim",
}

-- Colorscheme
vim.cmd("colorscheme tokyonight-moon")

-- Initialize lualine
require("lualine").setup{
    options = {
        theme = "horizon"
    }
}
