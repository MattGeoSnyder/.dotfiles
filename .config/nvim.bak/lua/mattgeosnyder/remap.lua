vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "[a", vim.cmd.prev)
vim.keymap.set("n", "]a", vim.cmd.next)
vim.keymap.set("n", "[A", vim.cmd.prev)
vim.keymap.set("n", "]A", vim.cmd.next)

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "number"

vim.keymap.set('n', '<leader>ds', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>dn', function() require('dap').step_over() end)
vim.keymap.set('n', '<leader>di', function() require('dap').step_into() end)
vim.keymap.set('n', '<leader>do', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)

