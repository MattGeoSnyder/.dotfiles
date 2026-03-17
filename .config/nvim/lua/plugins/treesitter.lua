return {
  {
    'nvim-treesitter/nvim-treesitter',
    lcode_actionazy = false,
    build = ':TSUpdate',
    config = function()
      require("nvim-treesitter").install({ "lua", "vim", "vimdoc", "javascript", "typescript", "html",
        "css", "c", "python" })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
      -- Disable entire built-in ftplugin mappings to avoid conflicts.
      -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
      vim.g.no_plugin_maps = true

      -- Or, disable per filetype (add as you like)
      -- vim.g.no_python_maps = true
      -- vim.g.no_ruby_maps = true
      -- vim.g.no_rust_maps = true
      -- vim.g.no_go_maps = true
    end,
    config = function()
      -- put your config here
      require("nvim-treesitter-textobjects").setup {
        select = {
          lookahead = true,
          ['@parameter.outer'] = 'v',
          ['@parameter.outer'] = 'V',
        },
        include_surrounding_whitespace = false,
      }
      vim.keymap.set({ "x", "o" }, "af", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.outer",
          "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "if", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.inner",
          "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "ac", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.outer",
          "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "ic", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.inner",
          "textobjects")
      end)
    end,
  }
}
