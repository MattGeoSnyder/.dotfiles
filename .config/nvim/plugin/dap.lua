local dapjs = require("dap-vscode-js")
local dappy = require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
local dap = require("dap")

dapjs.setup({
	debugger_path = "/home/mattgeosnyder/.local/share/nvim/lazy/vscode-js-debug",
	adapters = {'pwa-node', 'node-terminal', 'pwa-chrome' },
	log_file_level = 1,
	log_console_level = vim.log.levels.ERROR,
})

local languages = {"javascript", "typescript", "javascriptreact", "typescriptreact"}


	dap.adapters["node-terminal"] = {
		type = "server",
		command = "npm run dev",
		host = "127.0.0.1",
		port = 9229,
	}

for _, lang in ipairs(languages) do
	dap.configurations[lang] = {
		{
			type = "node-terminal",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",

		},
	}
end
