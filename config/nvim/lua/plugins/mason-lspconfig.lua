require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls",        -- Bash
        "julials",       -- Julia
        "jsonls",        -- JSON
        "sumneko_lua",   -- Lua
        "pyright",       -- Python
        "sqlls",         -- SQL
        "taplo",         -- TOML
        "yamlls",        -- YAML
    }
})
