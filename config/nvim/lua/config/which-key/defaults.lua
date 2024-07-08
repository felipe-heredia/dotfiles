return {
  mode = { "n", "v" },
  [";"] = { ":Alpha<CR>", "Dashboard" },
  w = { ":w!<CR>", "Save" },
  q = { ":confirm q<CR>", "Quit" },
  h = { ":nohlsearch<CR>", "No Highlight" },
  f = {
    name = "Find",
    f = { ":let @+=@%", "Get file name" },
  },
  a = {
    name = "Add",
    t = {
      name = "GoTag",
      j = {
        "<cmd> GoTagAdd json <CR>",
        "Add json struct tags",
      },
    },
  },
}
