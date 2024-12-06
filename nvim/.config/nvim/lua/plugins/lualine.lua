return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                section_separators = { left = '', right = '' },
                component_separators = { left = '╲', right = '╱' },
            },
            sections = {
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                        symbols = {
                            modified = '●',
                            readonly = ''
                        }
                    }
                },
                lualine_x = {
                    'filesize',
                    'filetype'
                }
            }
        }
    }
}
