return {
    -- LSP
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
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
    { 'ThePrimeagen/vim-be-good' },
}
