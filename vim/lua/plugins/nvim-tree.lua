return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  priority = 1000,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  config = function()
      local nvim_tree = require("nvim-tree")
      nvim_tree.setup({
        sort = {
            sorter = "case_sensitive",
        },
        view = {
            width = 35,
        },
        filters = {
            dotfiles = true,
        }
      })

      local opts = { noremap = true, silent = true }
      local keymap = vim.keymap
      keymap.set("n", "<Leader>tt", "<cmd>NvimTreeToggle<CR>", opts)
      keymap.set("n", "<Leader>to", "<cmd>NvimTreeOpen<CR>", opts)
      keymap.set("n", "<Leader>tc", "<cmd>NvimTreeClose<CR>", opts)
      keymap.set("n", "<Leader>tf", "<cmd>NvimTreeFocus<CR>", opts)
  end,
}
