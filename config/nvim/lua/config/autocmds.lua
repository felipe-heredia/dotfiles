local enabled_filetypes = { "typescript", "javascript", "json", "lua", "astro", "css", "scss", "prisma", "go" }

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  command = "FormatWriteLock",
})

vim.api.nvim_exec(
  string.format(
    [[
  autocmd FileType %s setlocal foldmethod=indent
]],
    table.concat(enabled_filetypes, ",")
  ),
  false
)

vim.cmd([[
  hi NotifyBackground guibg = #000000
]])
