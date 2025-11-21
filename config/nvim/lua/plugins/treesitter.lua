return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      local context = require("treesitter-context")

      context.setup({
        enable = true,
        max_lines = 5,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")

      config.setup({
        ensure_installed = { "typescript", "javascript", "lua", "markdown", "astro" },
        auto_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
