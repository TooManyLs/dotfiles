-- Sort and organize imports
vim.api.nvim_create_user_command("Isort", 
    function()
        vim.cmd("silent !ruff check % --select I --fix")
    end, {}
)
