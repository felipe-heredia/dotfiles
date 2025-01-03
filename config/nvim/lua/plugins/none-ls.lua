return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,

        null_ls.builtins.formatting.prettierd.with({ extra_filetypes = { "astro" } }),

        -- null_ls.builtins.diagnostics.eslint_d,
        -- null_ls.builtins.formatting.eslint_d,

        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports_reviser,

        -- null_ls.builtins.formatting.eslint_d.with({ extra_filetypes = { "astro" } }),
      },
    })
  end,
}
