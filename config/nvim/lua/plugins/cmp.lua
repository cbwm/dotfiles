-- set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

local cmp = require 'cmp'
cmp.setup({
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end
    },
    formatting = {
        format = function(entry, vim_item)
            --set a name for each source
            vim_item.menu = ({
                buffer = "[Buff]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                latex_symbols = "[Latex]"
            })[entry.source.name]
            return vim_item
        end
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false
        }),
        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --         cmp.select_next_item()
        --     elseif luasnip.expand_or_jumpable() then
        --         luasnip.expand_or_jump()
        --     elseif has_words_before() then
        --         cmp.complete()
        --     else
        --         fallback()
        --     end
        -- end, {"i", "s"})
        -- ["<S-Tab>"] = cmp.mapping(function(fallback)end)
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer', keyword_length = 1 },
        { name = 'calc' },
        { name = 'latex_symbols' },
    })
})
