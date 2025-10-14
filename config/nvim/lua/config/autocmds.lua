local enabled_filetypes =
{ "typescript", "javascript", "json", "lua", "astro", "css", "scss", "prisma", "go", "typescriptreact" }

for _, filetype in ipairs(enabled_filetypes) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetype,
    callback = function()
      vim.opt_local.foldmethod = "indent"
    end,
  })
end

vim.cmd([[
  hi NotifyBackground guibg = #000000
]])
