return {
  mode = { "n", "v" },
  [";"] = { ":Alpha<CR>", "Dashboard" },
  w = { ":w!<CR>", "Save" },
  q = { ":confirm q<CR>", "Quit" },
  h = { ":nohlsearch<CR>", "No Highlight" },
  f = {
    name = "Find",
  },
  p = {
    ":lua print(Get_current_directory())<CR>",
    "Show file PATH",
  },
}
