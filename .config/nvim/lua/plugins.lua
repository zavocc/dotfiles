-- Plugins setup
-- Check if we have git installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- Check if git is installed
  if vim.fn.executable("git") == 0 then
    print("Git not found!")
    return
  end
  -- Install lazy
  vim.fn.system({
    "git","clone","--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
-- Lazy load plugins
local lsp_plugins = {
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "onsails/lspkind.nvim",
    "ray-x/lsp_signature.nvim"
}

require("lazy").setup{
    "tpope/vim-sleuth",
    "tpope/vim-fugitive",
    "nvim-lualine/lualine.nvim",
    "nvim-tree/nvim-web-devicons",
    "romgrk/barbar.nvim",
    "chrisbra/changesPlugin",
    "ntpeters/vim-better-whitespace",
    "folke/tokyonight.nvim",
    "nvim-tree/nvim-tree.lua",
    lsp_plugins
}

-- colorscheme
vim.cmd("colorscheme tokyonight-moon")

-- nvim-tree
require("nvim-tree").setup()
-- toggle and focus
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<C-f>', ':NvimTreeFocus<CR>')

-- Initialize lualine
require("lualine").setup{
    options = {
        theme = "horizon"
    }
}

-- Setup LSP
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp_signature").on_attach({
      bind = true,
    }, bufnr)
  end,
})

require'lspconfig'.pyright.setup{}
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')

lspconfig.pyright.setup{
  capabilities = capabilities,
}

-- luasnip setup
local luasnip = require("luasnip")

-- For icons
local lspkind = require('lspkind')

-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  -- Enable in-line suggestions
  experimental = { ghost_text = true },
  -- Icons
  formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol',
        maxwidth = 30,
        ellipsis_char = '...',
        show_labelDetails = true,
      })
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    -- Prefer tab to accept completion
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lsp_signature_help' },
  },
}
