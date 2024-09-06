require('config.settings')
require('config.lazy')

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconf = require('lspconfig')

--lspconf.ruff.setup({
--    capabilities = capabilities,
--    init_options = {
--        settings = {
--            configuration = '~/.config/ruff/ruff.toml',
--            lineLength = 79,
--            showSyntaxErrors = true,
--        },
--    },
--})

lspconf.pyright.setup{
    capabilities = capabilities,
} 

lspconf.rust_analyzer.setup {
    capabilities = capabilities,
}

local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup ({
    enabled = function()

        -- disable completion in comments

        local context = require 'cmp.config.context'
        if vim.api.nvim_get_mode().mode == 'c' then
            return true
        else
            return not context.in_treesitter_capture("comment")
                and not context.in_syntax_group("Comment")
        end
    end,
    
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-f>'] = cmp.mapping.scroll_docs(-4),    -- Up
        ['<C-d>'] = cmp.mapping.scroll_docs(4),     -- Down
        ['<C-Space>'] = cmp.mapping.complete(),
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
        { name = 'nvim_lsp_signature_help' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'luasnip' },
    },
})

