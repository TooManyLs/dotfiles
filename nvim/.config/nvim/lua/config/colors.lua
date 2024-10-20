function ColorsApply(color)
    color = color or "monokai-nightasty"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#22d0d0", bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "LazyNormal", { bg = "#262626" })
    vim.api.nvim_set_hl(0, "MasonNormal", { bg = "#262626" })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#dddddd", bg = "none" })
    vim.api.nvim_set_hl(0, "CursorLine", { bold = true, bg = "#313131" })
    vim.api.nvim_set_hl(0, "MatchParen", { bold = true, reverse = true})
end

ColorsApply()
