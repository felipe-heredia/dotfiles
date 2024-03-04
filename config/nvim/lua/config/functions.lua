Format_astro = function()
  local current_file = vim.fn.expand("%:p")

  vim.fn.system("prettier -w " .. current_file .. " --plugin=prettier-plugin-astro")

  vim.cmd("e!")
  vim.cmd("set modifiable")
end
