local functions = require("config.functions")

vim.keymap.set("n", "<leader>;", ":Alpha<CR>", { desc = "Dashboard" })

vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete without overwriting register" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "Delete selected without overwriting register" })

vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank selection to system clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("v", "<leader>p", '"+p', { desc = "Paste selection from system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })

vim.keymap.set("n", "<leader>f", function()
  functions.format(vim.api.nvim_get_current_buf())
end, { desc = "Format file using LSP" })

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list entry and center" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location list entry and center" })

vim.keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" }
)

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "No Highlight" })

vim.keymap.set("n", "<leader>e", ":e .<CR>", { desc = "Open Oil file explorer" })
vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open Oil file explorer in the current file" })
vim.keymap.set("n", "<leader>ga", function()
  functions.format_astro()
end, { desc = "Format astro file" })
vim.keymap.set("n", "<leader>x", "<cmd>source %<CR>")

vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected block down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected block up" })

vim.keymap.set("n", "<M-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix entry and center" })
vim.keymap.set("n", "<M-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix entry and center" })
vim.keymap.set("n", "cf", "<cmd> let @+ = expand('%:.')<CR>", { desc = "Copy file name" })

vim.keymap.set("n", "<leader>gb", function()
  Snacks.picker.git_log_line()
end, { desc = "Git Blame Line" })
