return {
    "tpope/vim-sleuth",
    "chrisbra/changesPlugin",
    {
        "ntpeters/vim-better-whitespace",
        -- Load whithespace only when it's needed
        lazy = true,
        cmd = {"StripWhitespace", "StripWhitespaceOnChangedLines"}
    }
}
