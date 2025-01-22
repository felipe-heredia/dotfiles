return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      local find_config_files = function()
        builtin.find_files({
          cwd = vim.fn.stdpath("config"),
        })
      end

      vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find Files" })
      vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find Git Files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope Help" })
      vim.keymap.set("n", "<leader>ps", builtin.colorscheme, { desc = "Colorscheme" })
      vim.keymap.set("n", "<leader>fc", find_config_files, { desc = "Find in config" })
      vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "Find document symbols" })

      vim.keymap.set("n", "<leader>vrr", builtin.lsp_references, { desc = "Find references" })

      telescope.setup({
        active = true,
        on_config_done = nil,
        pickers = {
          colorscheme = {
            enable_preview = true,
          },
          find_files = {
            theme = "ivy",
          },
        },
        extensions = {
          ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
          fzf = {},
        },
      })

      telescope.load_extension("ui-select")
    end,
  },
}
