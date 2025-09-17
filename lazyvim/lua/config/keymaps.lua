local map = vim.keymap.set
local dap = require("dap")

map("n", "<F5>", dap.continue)
map("n", "<F9>", dap.toggle_breakpoint)
map("n", "<F10>", dap.step_over)
map("n", "<F11>", dap.step_into)
map("n", "<Shift-F11>", dap.step_out)
