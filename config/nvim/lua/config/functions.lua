Format_astro = function()
  local current_file = vim.fn.expand("%:p")

  vim.fn.system("prettier -w " .. current_file .. " --plugin=prettier-plugin-astro")

  vim.cmd("e!")
  vim.cmd("set modifiable")
end

function Colorscheme(theme)
  local color = "catppuccin-mocha"

  if theme == "light" then
    color = "catppuccin-latte"
  end

  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
