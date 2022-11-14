require'catppuccin'.setup {
    integrations = {
        barbar = true,
        cmp = false,
        nvimtree = true,
        gitsigns = true,
        hop = false,
        mason = true,
        telescope = false,
        treesitter = true,
        -- special integrations
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
        },
    }
}
