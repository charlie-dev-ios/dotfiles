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
        local telescopeConfig = require("telescope.config")

        -- Clone the default Telescope configuration
        local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

        -- I want to search in hidden/dot files.
        table.insert(vimgrep_arguments, "--hidden")
        -- I don't want to search in the `.git` directory.
        table.insert(vimgrep_arguments, "--glob")
        table.insert(vimgrep_arguments, "!**/.git/*")

        require("telescope").setup{
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                        ["<C-h>"] = "which_key",
                    },
                },
                path_display = { "smart" },
                -- `hidden = true` is not supported in text grep commands.
                vimgrep_arguments = vimgrep_arguments,
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
