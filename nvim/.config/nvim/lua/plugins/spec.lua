return {
    -- LSP
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' }, 
    { 'L3MON4D3/LuaSnip' },

    -- git highlighting
    { 'lewis6991/gitsigns.nvim' },
    -- line/block commenting
    { 'numToStr/Comment.nvim' },
    -- indentation guides
    { 'lukas-reineke/indent-blankline.nvim' },

    -- syntax highlighting
    { 'nvim-treesitter/nvim-treesitter' },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },

    -- Fuzzy Finder (files, lsp, etc)
    { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you have trouble with this installation, refer to the README for telescope-fzf-native.
      build = 'make',
    },      
}
