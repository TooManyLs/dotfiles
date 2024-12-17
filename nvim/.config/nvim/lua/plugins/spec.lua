return {
    -- LSP
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim',
        opts = {
            ui = {
                border = "rounded",
            },
        }
    },
    { 'williamboman/mason-lspconfig.nvim' },

    -- line/block commenting
    { 'numToStr/Comment.nvim' },
    -- indentation guides
    { 'lukas-reineke/indent-blankline.nvim' },

    -- syntax highlighting
    { 'nvim-treesitter/nvim-treesitter' },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    { 'nvim-treesitter/nvim-treesitter-context', opts = {} },

    -- Fuzzy Finder (files, lsp, etc)
    { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you have trouble with this installation, refer to the README for telescope-fzf-native.
      build = 'make',
    },      
    { 'nvim-telescope/telescope-symbols.nvim' },

    -- a/i textobject manipulation
    { 'echasnovski/mini.ai', opts = {} },


    -- markdown preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = {
            vim.keymap.set("n", "<leader>fe", ":NvimTreeToggle <CR>"),
            view = {
                width = 50,
                number = true,
                relativenumber = true,
            },
            renderer = {
                add_trailing = true,
                highlight_git = "name",
                highlight_modified = "icon",
                indent_markers = {
                    enable = true,
                },
            },
            diagnostics = {
                enable = true,
            },
            modified = {
                enable = true,
            },
            sort = {
                sorter = "filetype",
            },
        }
    },
}
