return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme("tokyonight-storm")
    end,
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
}
