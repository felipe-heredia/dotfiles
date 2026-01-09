return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      model = "gemini-3-pro-preview",
      temperature = 0.5,
    },
  },
  { "tpope/vim-commentary" },
  { "ThePrimeagen/vim-be-good" },
  { "mattn/emmet-vim" },
  {
    "stevearc/oil.nvim",
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = { view_options = { show_hidden = true } },
  },
  {
    "ThePrimeagen/harpoon",
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<leader>he", ui.toggle_quick_menu)
      vim.keymap.set("n", "<leader>h1", function()
        ui.nav_file(1)
      end)
      vim.keymap.set("n", "<leader>h2", function()
        ui.nav_file(2)
      end)
      vim.keymap.set("n", "<leader>h3", function()
        ui.nav_file(3)
      end)
      vim.keymap.set("n", "<leader>h4", function()
        ui.nav_file(4)
      end)
    end,
  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {},
  },
}
