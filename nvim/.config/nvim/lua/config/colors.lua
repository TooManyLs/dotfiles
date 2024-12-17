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
    on_highlights = function(hl, c)
        hl["LineNr"] = hl["@type"]
        hl["CursorLineNr"] = hl["Function"]
    end,
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
require("ayu").setup({
    overrides = {
        Normal = { bg = "None" },
        ColorColumn = { bg = "None" },
        SignColumn = { bg = "None" },
        Folded = { bg = "None" },
        FoldColumn = { bg = "None" },
        CursorLine = { bg = "None" },
        CursorColumn = { bg = "None" },
        WhichKeyFloat = { bg = "None" },
        VertSplit = { bg = "None" },
        CursorLineNr = { link = "String" },
        LineNr = { link = "@variable" },
    },
})
vim.g.moonflyTransparent = true

vim.cmd.colorscheme("moonfly")
