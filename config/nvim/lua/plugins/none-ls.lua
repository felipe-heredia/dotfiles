return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        require("none-ls.diagnostics.eslint_d"),
        require("none-ls.code_actions.eslint_d"),

        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd.with({ extra_filetypes = { "astro" } }),

        null_ls.builtins.formatting.stylua,

        null_ls.builtins.formatting.prettierd.with({ extra_filetypes = { "astro" } }),

        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports_reviser,
      },
    })
  end,
}
