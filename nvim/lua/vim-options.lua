vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set nowrap")
vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function (event)
       vim.keymap.set("n", "<leader><Space>", ":ClangdSwitchSourceHeader\n");
    end,
})
