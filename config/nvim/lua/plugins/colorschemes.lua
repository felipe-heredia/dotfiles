return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("transparent").clear_prefix("NeoTree")

      require("transparent").setup({
        extra_groups = {
          "NormalFloat",
        },
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    config = function()
      -- vim.cmd.colorscheme("catppuccin-mocha")
      vim.cmd.colorscheme("catppuccin-latte")
    end,
  },
}
