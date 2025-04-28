local enabled_filetypes =
{ "typescript", "javascript", "json", "lua", "astro", "css", "scss", "prisma", "go", "typescriptreact" }

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end

    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
        end,
      })
    end
  end,
})

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
