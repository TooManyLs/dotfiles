vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('config.settings')
require('config.lazy')

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
  on_attach = function(bufnr)
    vim.keymap.set('n', '[c', require('gitsigns').prev_hunk, { buffer = bufnr })
    vim.keymap.set('n', ']c', require('gitsigns').next_hunk, { buffer = bufnr })
  end,
}

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Add indent guides
require("ibl").setup({
	indent = { char = "┊" },
	whitespace = { remove_blankline_trail = false },
})

require('Comment').setup()

-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native
require('telescope').load_extension 'fzf'

-- Add leader shortcuts
vim.keymap.set('n', '<leader><space>', function() require('telescope.builtin').buffers { sort_lastused = true } end)
vim.keymap.set('n', '<leader>sf', function() require('telescope.builtin').find_files { previewer = false } end)
vim.keymap.set('n', '<leader>sb', function() require('telescope.builtin').current_buffer_fuzzy_find() end)
vim.keymap.set('n', '<leader>sh', function() require('telescope.builtin').help_tags() end)
vim.keymap.set('n', '<leader>st', function() require('telescope.builtin').tags() end)
vim.keymap.set('n', '<leader>sd', function() require('telescope.builtin').grep_string() end)
vim.keymap.set('n', '<leader>sp', function() require('telescope.builtin').live_grep() end)
vim.keymap.set('n', '<leader>?', function() require('telescope.builtin').oldfiles() end)

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to show for a single context
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}

-- LSP settings
require('mason').setup {}
require('mason-lspconfig').setup()

local lspconf = require('lspconfig')
local on_attach = function(_, bufnr)
  local attach_opts = { silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, attach_opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, attach_opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, attach_opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, attach_opts)
  vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, attach_opts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, attach_opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, attach_opts)
  vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, attach_opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, attach_opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, attach_opts)
  vim.keymap.set('n', 'so', require('telescope.builtin').lsp_references, attach_opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities =require('cmp_nvim_lsp').default_capabilities(capabilities)

require'lspconfig'.pyright.setup{
    on_attach = on_attach,
    -- provide more clues about workspace
    root_dir = function(fname)
        return require'lspconfig.util'.root_pattern('.git', 'setup.py', 'pyrightconfig.json', '.venv', 'env')(fname) or vim.loop.os_homedir()
    end,
    capabilities = capabilities

}
local servers = { 'rust_analyzer' }
for _, lsp in ipairs(servers) do
    lspconf[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end

-- Autocompletion setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

luasnip.config.setup {}

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

