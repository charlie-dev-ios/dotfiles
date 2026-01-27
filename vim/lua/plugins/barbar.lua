return {
  "romgrk/barbar.nvim",
  dependencies = {
      'nvim-tree/nvim-web-devicons'
  },
  opts = {
    animation = true,
    tabpages = true,
  },
  event = "VeryLazy",
  keys = {
      { "<Leader>h", "<cmd>BufferPrevious<CR>" },
      { "<Leader>l", "<cmd>BufferNext<CR>" },
      { "<Leader>bp", "<cmd>BufferPick<CR>" },
      { "<Leader>bc", "<cmd>BufferClose<CR>" },
      { "<Leader>bac", "<cmd>BufferCloseAllButCurrentOrPinned<CR>" },
  },
}
