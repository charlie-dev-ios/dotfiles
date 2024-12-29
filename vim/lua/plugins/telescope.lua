-- plugins/telescope.lua:
return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { "<Leader>fo", "<cmd>lua require'telescope.builtin'.find_files {}<CR>" },
      { "<Leader>ff", "<cmd>lua require'telescope.builtin'.live_grep {}<CR>" },
      { "<Leader>fh", "<cmd>lua require'telescope.builtin'.help_tags {}<CR>" },
    },
    config = function()
        local actions = require("telescope.actions")
        require("telescope").setup{
          defaults = {
            mappings = {
              i = {
                ["<esc>"] = actions.close
              },
            },
            path_display = { "smart" },
          }
        }
    end,
}
