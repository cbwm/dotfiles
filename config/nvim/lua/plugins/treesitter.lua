require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash",
        "dockerfile",
        "fish",
        "json",
        "julia",
        "lua",
        "make",
        "python",
        "r",
        "sql",
        "toml",
        "yaml"
    },
    highlight = {
        enabled = true
    }
}
