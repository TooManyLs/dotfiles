return {
    { 'lewis6991/gitsigns.nvim',
        config = function()
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
        end
    },
    { 'tpope/vim-fugitive',
        config = function()
            -- Fullscreen git changes menu
            function git()
                vim.cmd("Git")
                vim.cmd("wincmd j")
                vim.cmd("quit")
            end
        end,
    },
}
