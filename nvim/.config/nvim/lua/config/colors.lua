require("catppuccin").setup({
    transparent_background = true,
})
require("monokai-nightasty").setup({
    dark_style_background = "transparent",
    hl_styles = {
        comments = { italic = false },
        functions = { bold = true },
        floats = "transparent",
    },
    markdown_header_marks = true,
})

vim.cmd.colorscheme("monokai-nightasty")
