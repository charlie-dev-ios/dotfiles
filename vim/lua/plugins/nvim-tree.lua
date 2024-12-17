return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  prioerity = 1000,
  keys = {
      { "<Leader>ee", "<cmd>NvimTreeToggle<CR>" },
      { "<Leader>ef", "<cmd>NvimTreeFindFile<CR>" },
      { "<Leader>er", "<cmd>NvimTreeRefresh<CR>" },
  },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  opts = {
    hijack_cursor = true,
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 35,
    },
    renderer = {
       indent_markers = {
           enable = true,
       },
    },
    filters = {
        dotfiles = false,
        custom = {
            "^\\.git$",
        },
    },
    git = {
        ignore = true,
    },
  },
}
