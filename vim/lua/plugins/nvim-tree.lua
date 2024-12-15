return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  -- nvim-treeはvim .をvim NeovimTree_1に書き換えてしまう
  -- そのためauto-sessionが正常に動作しなくなる
  -- 対応策として本来はLazyLoadするべきではないが遅延読み込みを行っている
  -- https://github.com/rmagatti/auto-session/issues/393
  cmd = {
    'NvimTreeOpen',
    'NvimTreeClose',
    'NvimTreeToggle',
    'NvimTreeFocus',
    'NvimTreeRefresh',
    'NvimTreeFindFile',
    'NvimTreeFindFileToggle',
    'NvimTreeClipboard',
    'NvimTreeResize',
    'NvimTreeCollapse',
    'NvimTreeCollapseKeepBuffers',
    'NvimTreeHiTest',
  },
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
