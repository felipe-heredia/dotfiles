return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  { "ThePrimeagen/harpoon" },
  { "mattn/emmet-vim" },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd([[slient! GoInstallDeps]])
    end,
  },
}
