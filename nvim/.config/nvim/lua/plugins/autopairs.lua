return {
    { 'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true,
        opts = {
            fast_wrap = {
                map = '<M-z>',
                cursor_pos_before = false,
            }
        },
    },
}
