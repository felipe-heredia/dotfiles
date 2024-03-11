return {
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    config = function()
      local formatter = require("formatter")

      formatter.setup({
        logging = true,
        log_level = vim.log.levels.WARN,
        filetype = {
          javascript = {
            require("formatter.filetypes.javascript").prettierd,
          },
          javascriptreact = {
            require("formatter.filetypes.javascriptreact").prettierd,
          },
          typescript = {
            require("formatter.filetypes.typescript").prettierd,
          },
          typescriptreact = {
            require("formatter.filetypes.typescriptreact").prettierd,
          },
          lua = {
            require("formatter.filetypes.lua").stylua,
          },
          ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace,
          },
        },
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = {
          "prettierd",
          "eslint_d",
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup()
    end,
  },
}
