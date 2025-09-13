return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                cpp = { "clang-format" },
                c = { "clang-format" },
            },
            formatters = {
                clang_format = {
                    prepend_args = {
                        "--style=file",
                        "--fallback-style=LLVM",
                    },
                },
            },
        })
    end,
}

