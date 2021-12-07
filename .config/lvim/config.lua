local formatters = require "lvim.lsp.null-ls.formatters"
local linters = require "lvim.lsp.null-ls.linters"

-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.builtin.terminal.active = true
-- lvim.colorscheme = "onedarker"
lvim.colorscheme = "omni"

formatters.setup {
  { exe = "prettier" },
}

linters.setup {
  { exe = "eslint" },
}

lvim.plugins = {
  {"dracula/vim"},
  {"getomni/neovim"},
  {"p00f/nvim-ts-rainbow"},
  {"editorconfig/editorconfig-vim"},
  {"mattn/emmet-vim"},
  {"kkvh/vim-docker-tools"},
  {
    "pantharshit00/vim-prisma",
    config = function ()
      vim.g.prism_colorshemes = {"dracula"}
    end,
  },
  {
    "andweeb/presence.nvim",
    config = function()
      vim.g.presence_main_image = "file"
      vim.g.presence_neovim_image_text = "O único verdadeiro editor de texto"
      vim.g.presence_enable_line_number = true
    end,
  },
  -- {"isRuslan/vim-es6"},
  { "hail2u/vim-css3-syntax" },
  {
    "luochen1990/rainbow",
    config = function()
      vim.g.rainbow_active = true
    end,
  },
  {
    "npxbr/glow.nvim",
    ft = {"markdown"},
    config = function ()
      vim.g.glow_binary_path = vim.env.HOME .. "/bin"
    end,
  },
  {"wakatime/vim-wakatime"},
  {"ap/vim-css-color"},
  {
    "leafOfTree/vim-vue-plugin",
    config = function()
      vim.g.vim_vue_plugin_use_scss = true
      vim.g.vim_vue_plugin_highlight_vue_keyword = true
      vim.g.vim_vue_plugin_config = {
        syntax = {
          template = {"html"},
          script = {"javascript"},
          style = {"css", "scss"},
        },
        foldexpr = true,
      }
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = true
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup({
        autotag = { enable = true },
        filetypes = { "html", "vue", "javascript", "javascriptreact", "typescriptreact" }
      })
    end,
  },
  {
    "rmagatti/goto-preview",
    config = function()
    require('goto-preview').setup {
      width = 120; -- Width of the floating window
      height = 25; -- Height of the floating window
      default_mappings = false; -- Bind default mappings
      debug = false; -- Print debug information
      opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
      post_open_hook = nil; -- A function taking two arguments, a buffer and a window to be ran as a hook.
    }
    end
  },
}

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.hidden = true
vim.opt.number = true
vim.opt.inccommand = "split"
vim.opt.linebreak = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"
--   -- for input mode
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
--   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--     args = {}
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--     args = {}
--   }
-- }

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"}, {
--         "ray-x/lsp_signature.nvim",
--         config = function() require"lsp_signature".on_attach() end,
--         event = "InsertEnter"
--     }
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
