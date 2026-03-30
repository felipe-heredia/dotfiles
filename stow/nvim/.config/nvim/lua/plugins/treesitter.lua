return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.config").setup()

      -- Install parsers if missing
      local installed = require("nvim-treesitter.config").get_installed()
      local ensure = { "typescript", "javascript", "lua", "markdown", "astro" }
      local to_install = vim.tbl_filter(function(lang)
        return not vim.list_contains(installed, lang)
      end, ensure)
      if #to_install > 0 then
        vim.cmd("TSInstall " .. table.concat(to_install, " "))
      end
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
