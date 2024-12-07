return {
  "Mofiqul/dracula.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    colorscheme = "dracula",
  },
  config = function()
    vim.cmd([[colorscheme dracula]])
  end,
  enabled = false
}

