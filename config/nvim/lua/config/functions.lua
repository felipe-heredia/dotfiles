local M = {}

M.format_astro = function()
  local current_file = vim.fn.expand("%:p")

  vim.fn.system("prettier -w " .. current_file .. " --plugin=prettier-plugin-astro")

  vim.cmd("e!")
  vim.cmd("set modifiable")
end

function M.colorscheme(theme)
  local color = "catppuccin-mocha"

  if theme == "light" then
    color = "catppuccin-latte"
  end

  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function M.format(bufnr)
  vim.lsp.buf.format({
    async = false,
    bufnr = bufnr,
    filter = function(cl)
      return cl.name == "null-ls"
    end,
  })
end

return M
