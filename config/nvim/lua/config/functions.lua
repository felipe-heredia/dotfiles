Format_astro = function()
  local current_file = vim.fn.expand("%:p")

  vim.fn.system("prettier -w " .. current_file .. " --plugin=prettier-plugin-astro")

  vim.cmd("e!")
  vim.cmd("set modifiable")
end

Get_current_directory = function()
  local cwd = vim.fn.getcwd()
  local current_file_directory = vim.fn.expand("%:p:h")
  local pattern = "^" .. vim.fn.escape(cwd, "/") .. "/"
  local substituted_directory = vim.fn.substitute(current_file_directory, pattern, "", "")
  local result = substituted_directory:match("/([^/]+)/[^/]+$") or ""
  return result
end
