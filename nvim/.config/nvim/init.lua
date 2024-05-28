require('mattgeosnyder')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }

	},
	{'nvim-treesitter/nvim-treesitter'},
	{'mbbill/undotree'},

	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},

	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	},
	{
		"github/copilot.vim"
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{
		"tpope/vim-fugitive",
	},
	{
		"onsails/lspkind-nvim",
	},
	{
		"hrsh7th/cmp-buffer",
	},
	{
		"windwp/nvim-autopairs",
	},
	{
		"MunifTanjim/prettier.nvim",
		dependencies = { "jose-elias-alvarez/null-ls.nvim" },
	},
	{
		"lewis6991/gitsigns.nvim",
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	{
		"mxsdev/nvim-dap-vscode-js",
		dependencies = { "mfussenegger/nvim-dap" }
	},
	{
		"microsoft/vscode-js-debug",
		build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	},
	{	
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
		"jay-babu/mason-nvim-dap.nvim",

	},
	{
		"tpope/vim-commentary",
	},
	{
		"mfussenegger/nvim-dap-python"
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false
	},
	{
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-vsnip',
		'hrsh7th/vim-vsnip',
		'hrsh7th/cmp-nvim-lsp-signature-help'
	},
	{
		"simrat39/rust-tools.nvim",
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function () 
			vim.g.rustfmt_autosave = 1
		end
	},

})
