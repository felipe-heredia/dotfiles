return {
  { "tpope/vim-commentary" },
  { "ThePrimeagen/vim-be-good" },
  { "mattn/emmet-vim" },
  { "wakatime/vim-wakatime",   lazy = false },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
  },
  {
    "ThePrimeagen/harpoon",
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
      vim.keymap.set("n", "<C-h>", function()
        ui.nav_file(1)
      end)
      vim.keymap.set("n", "<C-t>", function()
        ui.nav_file(2)
      end)
      vim.keymap.set("n", "<C-n>", function()
        ui.nav_file(3)
      end)
      vim.keymap.set("n", "<C-s>", function()
        ui.nav_file(4)
      end)
    end,
  },
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
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
  },
  {
    "hedyhli/outline.nvim",
    config = function()
      vim.keymap.set("n", "<leader>o", vim.cmd.Outline, { desc = "Toggle Outline" })

      require("outline").setup()
    end,
  },
}
