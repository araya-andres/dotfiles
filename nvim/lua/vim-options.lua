vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set nowrap")

vim.cmd("set showbreak=↪")

vim.cmd("set splitright")
vim.cmd("set splitbelow")

vim.cmd("set undodir=$HOME/.vim_undo_dir")
vim.cmd("set undofile")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "cpp",
	callback = function(event)
		vim.cmd('let &makeprg = "cd build && make"')
		vim.keymap.set("n", "<leader><Space>", ":ClangdSwitchSourceHeader<Cr>")
		vim.keymap.set("n", "<leader>b", ":make<Cr>")
	end,
})
