return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
      vim.keymap.set("n", "<leader>cs", builtin.colorscheme, { desc = "Colorscheme" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        active = true,
        on_config_done = nil,
        theme = "dropdown",
        pickers = {
          colorscheme = {
            enable_preview = true,
          },
        },
        extensions = {
          ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
        },
      })

      telescope.load_extension("ui-select")
    end,
  },
}
