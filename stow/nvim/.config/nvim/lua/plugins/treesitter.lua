return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({})

      -- Install parsers if missing
      require("nvim-treesitter").install({ "typescript", "javascript", "lua", "markdown", "astro" })

      -- Enable treesitter highlighting and indentation for all filetypes
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
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
}
