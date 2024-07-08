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
          typescript = {
            require("formatter.filetypes.typescript").prettierd,
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
    opts = {
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "prismals",
        "gopls",
      },
    },
  },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local util = require("lspconfig/util")

      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.prismals.setup({})

      lspconfig.gopls.setup({
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        rootdir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      })

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
