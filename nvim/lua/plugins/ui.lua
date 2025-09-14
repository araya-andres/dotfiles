return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "catppuccin-macchiato"
        end
    },
    {
        "lewis6991/gitsigns.nvim",
    },
}
