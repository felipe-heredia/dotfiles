return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "meuter/lualine-so-fancy.nvim" },
  enabled = true,
  lazy = false,
  event = { "BufReadPost", "BufNewFile", "VeryLazy" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "iceberg_light",
        globalstatus = true,
        icons_enabled = true,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {
            "alpha",
            "help",
            "neo-tree",
            "Trouble",
            "spectre_panel",
            "toggleterm",
          },
        },
      },
      sections = {
        lualine_a = { "fancy_mode" },
        lualine_b = { "fancy_branch", "fancy_diff" },
        lualine_c = {
          {
            "filename",
            path = 1,
            symbols = {
              modified = "  ",
              readonly = "  ",
              unnamed = "  ",
            },
          },
        },
        lualine_x = {
          { "fancy_diagnostics", sources = { "nvim_lsp" }, symbols = { error = " ", warn = " ", info = " " } },
          "fancy_macro",
          "fancy_searchcount",
        },
        lualine_y = {
          "progress",
        },
        lualine_z = {
          "fancy_lsp_servers",
        },
      },
      inactive_sections = {
        lualine_c = { "filename" },
      },
      extensions = { "neo-tree", "lazy" },
    })
  end,
}
