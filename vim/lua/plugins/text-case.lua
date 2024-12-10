return {
  "johmsalas/text-case.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("textcase").setup({})
    require("telescope").load_extension("textcase")

    local opts = { noremap = true, silent = true }
  end,
  keys = {
    "ga",
    { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope" },
    { "gas", "<cmd>:lua require('textcase').current_word('to_snake_case')<CR>" },
    { "gac", "<cmd>:lua require('textcase').current_word('to_camel_case')<CR>" },
    { "gap", "<cmd>:lua require('textcase').current_word('to_pascal_case')<CR>" },
    { "gad", "<cmd>:lua require('textcase').current_word('to_dash_case')<CR>" },
  },
  lazy = true,
}
