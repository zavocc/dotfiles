return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        -- Please see https://lazy.folke.io/spec#spec-setup
        -- :NvimTree* editor commands won't be populated until config is set to true or
        -- manual setup is ran
        config = true
        -- or 
        -- config = function()
        --    require("nvim-tree").setup({})
        -- end,
    },
    "tpope/vim-sleuth",
    "chrisbra/changesPlugin",
    {
        "ntpeters/vim-better-whitespace",
        -- Load whithespace only when it's needed
        lazy = true,
        cmd = {"StripWhitespace", "StripWhitespaceOnChangedLines"}
    }
}
