vim.opt.number = true
vim.opt.cursorline = true

-- Tab to spaces
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- Disable text wrapping so I can work with small windows
vim.opt.wrap = false

-- Plugins setup
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
    "nvim-tree/nvim-web-devicons",
    "romgrk/barbar.nvim",
    "ryanoasis/vim-devicons",
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
