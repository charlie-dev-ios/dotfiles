return {
  "johmsalas/text-case.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("textcase").setup({})
    require("telescope").load_extension("textcase")

    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "gas", "<cmd>:lua require('textcase').current_word('to_snake_case')<CR>", opts)
    vim.keymap.set("n", "gac", "<cmd>:lua require('textcase').current_word('to_camel_case')<CR>", opts)
    vim.keymap.set("n", "gap", "<cmd>:lua require('textcase').current_word('to_pascal_case')<CR>", opts)
    vim.keymap.set("n", "gad", "<cmd>:lua require('textcase').current_word('to_dash_case')<CR>", opts)
  end,
  keys = {
    "ga",
  },
  lazy = false,
} 
