vim.api.nvim_create_autocmd("FileType", {
	pattern = "cpp",
	callback = function(event)
		vim.cmd('let &makeprg = "cd build && make"')
		vim.keymap.set("n", "<leader><Space>", ":ClangdSwitchSourceHeader<Cr>")
		vim.keymap.set("n", "<F7>", ":make<Cr>")
	end,
})
