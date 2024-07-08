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

--[[-----------------------------------------------------------------------------------
Plugins
-----------------------------------------------------------------------------------]]--
-- Plugins setup
-- Check if we have git installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
  -- disable lazy loading
  -- so far there's no performance impact on my plugins yet and lazy loading loads plugins on demand through events
  -- this can be differentiated by adding colorscheme and setting the config function, and load neovim with and without lazy loading
  -- https://www.reddit.com/r/neovim/comments/136k01s/what_are_plugins_that_should_not_be_lazy_loaded/
  -- https://www.reddit.com/r/neovim/comments/uwndk0/do_you_use_lazy_loading_and_why/
  default = { lazy = false },
})
