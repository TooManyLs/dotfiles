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
                attach_to_untracked = true,
                current_line_blame_opts = {
                    virt_text_pos = "right_align",
                },
                on_attach = function(bufnr)
                    vim.keymap.set('n', '[c', require('gitsigns').prev_hunk, { buffer = bufnr })
                    vim.keymap.set('n', ']c', require('gitsigns').next_hunk, { buffer = bufnr })
                    vim.keymap.set('n', '<leader>gb', require('gitsigns').toggle_current_line_blame)
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
