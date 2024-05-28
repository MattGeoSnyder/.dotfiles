require("mason-nvim-dap").setup({
	automatic_installation = true,
	handlers = {},
	ensure_installed = { 'microsoft/vscode-js-debug', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
})
