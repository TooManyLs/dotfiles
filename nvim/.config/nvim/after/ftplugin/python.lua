-- Auto formatting on save
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.py",
    callback = function()
        vim.cmd("silent !ruff format %")
    end,
})

-- Sort and organize imports
vim.api.nvim_create_user_command("Isort", 
    function()
        vim.cmd("silent !ruff check % --select I --fix")
    end, {}
)
