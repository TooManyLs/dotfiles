return {
    {
        "hachy/eva01.vim",
        lazy = false,
        priority = 1000,
        config = function()
          vim.cmd.colorscheme "eva01"
        end,
    },
    {
      "Tsuzat/NeoSolarized.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
--        config = function()
--          vim.cmd [[ colorscheme NeoSolarized ]]
--        end
    },
}
