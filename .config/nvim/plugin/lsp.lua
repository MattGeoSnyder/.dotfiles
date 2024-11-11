local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- here you can setup the language servers
require('lspconfig').tsserver.setup({})
require('lspconfig').pyright.setup({})
require('lspconfig').lua_ls.setup({

	settings = {

		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = vim.split(package.path, ';'),
			},
			diagnostics = {
				globals = {'vim'},
			},
			workspace = {
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				},
			},
		},
	},
})
require('lspconfig').tailwindcss.setup({})
require('lspconfig').rust_analyzer.setup({
	filetypes = { "rust" },
	root_dir = require("lspconfig/util").root_pattern("Cargo.toml"),
	setttings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy"
			},
			cargo = {
				allFeatures = true
			}
		}
	}
})
