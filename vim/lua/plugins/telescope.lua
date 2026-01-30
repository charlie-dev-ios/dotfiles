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
        { "<Leader>fr", "<cmd>lua require'telescope.builtin'.registers {}<CR>" },
        { "<Leader>fb", "<cmd>lua require'telescope.builtin'.builtin {}<CR>" },
        { "<Leader>fc", "<cmd>lua require'telescope.builtin'.commands {}<CR>" },
    },
    config = function()
        local actions = require("telescope.actions")

        require("telescope").setup{
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                        ["<C-h>"] = "which_key",
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                    },
                },
                path_display = { "smart" },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                    "--glob",
                    "!**/.git/*",
                },
            },
            pickers = {
                find_files = {
                    -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                },
            },
        }
    end,
}
