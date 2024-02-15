vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  command = "FormatWriteLock",
})

vim.api.nvim_create_autocmd({ "BufWritePost *.astro" }, {
  command = "call system('prettier -w . --plugin=prettier-plugin-astro') | e! | set modifiable",
})
