return {
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
            vim.keymap.set('n', '<C-f>', ':NvimTreeFocus<CR>')
        end
    }
}
