vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  command = "FormatWriteLock",
})

local enabled_filetypes = { "typescript", "javascript", "json", "lua" }

vim.api.nvim_exec(
  string.format(
    [[
  autocmd FileType %s setlocal foldmethod=indent
]],
    table.concat(enabled_filetypes, ",")
  ),
  false
)
