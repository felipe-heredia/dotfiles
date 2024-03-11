return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {},
  config = function(_, opts)
    local which_key = require("which-key")
    which_key.setup(opts)
    which_key.register(require("config.which-key.defaults"), {
      mode = "n",
      prefix = "<leader>",
    })

    which_key.register(require("config.which-key.non-leader"))
  end,
}
