-- Map leader
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('config.remap')
require('config.settings')
require('config.lazy')
require('config.colors')

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

require('leap').create_default_mappings()

-- Add indent guides
require("ibl").setup({
    indent = { char = "▏" },
    whitespace = { highlight = {"Whitespace"}, remove_blankline_trail = false },
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
local tbuiltin = require('telescope.builtin')
local tpreviewers = require('telescope.previewers')

vim.keymap.set('n', '<leader><space>', function() tbuiltin.buffers { sort_lastused = true } end)
vim.keymap.set('n', '<leader>sf', function() tbuiltin.find_files { previewer = true } end)
vim.keymap.set('n', '<leader>sb', function() tbuiltin.current_buffer_fuzzy_find() end)
vim.keymap.set('n', '<leader>sh', function() tbuiltin.help_tags() end)
vim.keymap.set('n', '<leader>st', function() tbuiltin.tags() end)
vim.keymap.set('n', '<leader>sp', function() tbuiltin.live_grep() end)
vim.keymap.set('n', '<leader>?', function() tbuiltin.oldfiles() end)
vim.keymap.set('n', '<leader>em', function() tbuiltin.symbols() end)

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
    enable = false,
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

-- LSP settings
require('mason').setup {}
require('mason-lspconfig').setup({
  ensure_installed = {
    'rust_analyzer',
    'pyright',
    'ruff',
  }
})

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

local servers = { 'rust_analyzer', 'pyright', 'ruff' }
for _, lsp in ipairs(servers) do
    lspconf[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end

-- Autocompletion setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'
local compare = cmp.config.compare
local comparator = require('cmp_lsp_rs').comparators

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
    window = {
        documentation = cmp.config.window.bordered(),
        completion = cmp.config.window.bordered({ col_offset = -3 }),
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-f>'] = cmp.mapping.scroll_docs(-4),    -- Up
        ['<C-d>'] = cmp.mapping.scroll_docs(4),     -- Down
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<C-j>'] = cmp.mapping.select_next_item{
            behavior = cmp.SelectBehavior.Select,
        },
        ['<C-k>'] = cmp.mapping.select_prev_item{
            behavior = cmp.SelectBehavior.Select,
        },
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'path' },
        { name = 'luasnip', keyword_length = 4 },
    }, {
        { name = 'buffer' },
    }),
    performance = {
        max_view_entries = 15,
    },
    experimental = {
        ghost_text = true,
    }
})

cmp.setup.filetype("rust", {
    sorting = {
        comparators = {
            compare.exact,
            compare.score,
            comparator.inscope_inherent_import,
            comparator.sort_by_lable_but_underscore_last,
        }
    },
})

cmp.setup.filetype("sql", {
    sources = {
        { name = 'vim-dadbod-completion' },
        { name = 'buffer' },
    },
})

-- For some reason TS prevents LSP from autostarting
-- so I added this workaround.
vim.cmd('LspStart')

-- Rounded borders for hover/signatureHelp floating windows
local _border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border
  }
)

vim.diagnostic.config{
  float={border=_border}
}
