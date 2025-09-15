return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				cpp = { "clang-format" },
				c = { "clang-format" },
				lua = { "stylua" },
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
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
