local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Bash
require("lspconfig")['bashls'].setup {
    capabilities = capabilities,
}

-- Julia
require("lspconfig")['julials'].setup {
    julia_env_path = "~/.julia/environments/v1.8",
    capabilities = capabilities,
}

-- JSON
require("lspconfig")['jsonls'].setup {
    capabilities = capabilities,
}

-- Lua
require("lspconfig")['sumneko_lua'].setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim"}
            }
        }
    },
    capabilities = capabilities,
}

-- Python
require("lspconfig")['pyright'].setup {
    capabilities = capabilities,
}

-- SQL
require("lspconfig")['sqlls'].setup {
    capabilities = capabilities,
}

-- TOML
require("lspconfig")['taplo'].setup {
    capabilities = capabilities,
}

-- YAML
require("lspconfig")['yamlls'].setup {
    capabilities = capabilities,
}
