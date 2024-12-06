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
require("eldritch").setup({
    transparent = true,
    styles = {
        comments = { italic = false },
        functions = { bold = true },
        sidebars = "transparent",
        floats = "transparent",
    },
    on_highlights = function(hl, c)
        hl["TelescopeNormal"] = hl.background
    end,
})

vim.cmd.colorscheme("monokai-nightasty")
