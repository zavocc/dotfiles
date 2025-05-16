return {
    "nvim-tree/nvim-web-devicons",
    {
        "romgrk/barbar.nvim",
        config = function()
            _opts = {noremap = true, silent = true}
            --alt
            vim.keymap.set('n', '<A-Left>', '<Cmd>BufferPrevious<CR>', _opts)
            vim.keymap.set('n', '<A-Right>', '<Cmd>BufferNext<CR>', _opts)
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                theme = "tokyonight",
            },
        },
    },
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
}
