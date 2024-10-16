vim.keymap.set("n", "<leader>;", ":Alpha<CR>", { desc = "Dashboard" })

vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected block down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected block up" })

vim.keymap.set("n", "<leader>p", '"_dP', { desc = "Paste without overwriting register" })
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete without overwriting register" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "Delete selected without overwriting register" })

vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank selection to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })

vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end, { desc = "Format file using LSP" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix entry and center" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix entry and center" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list entry and center" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location list entry and center" })

vim.keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" }
)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "No Highlight" })

vim.keymap.set("n", "<leader>e", ":Neotree filesystem toggle reveal float<CR>")
vim.keymap.set("n", "<leader>gs", ":Neotree git_status toggle float<CR>")
vim.keymap.set("n", "<leader>ga", ":lua Format_astro()<CR>", { desc = "Format astro file" })
