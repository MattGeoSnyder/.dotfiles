require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "rust_analyzer", "eslint", 
	"basedpyright"},
})
require("mason-nvim-dap").setup({
	automatic_installation = true,
	handlers = {},
	ensure_installed = { 'microsoft/vscode-js-debug', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
})
