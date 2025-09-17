-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4

vim.api.nvim_create_autocmd("FileType", {
	pattern = "cpp",
	callback = function(event)
		vim.cmd('let &makeprg = "cd build && make"')
		vim.keymap.set("n", "<leader><Space>", ":ClangdSwitchSourceHeader<Cr>")
		vim.keymap.set("n", "<F7>", ":make<Cr>")
	end,
})
