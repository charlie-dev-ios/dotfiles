return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufNewFile", "BufRead" },
    config = function ()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {
                -- default
                "lua",
                "vim",
                "vimdoc",
                "query",
                "elixir",
                "heex",
                "javascript",
                "html",
                -- optional,
                "swift",
                "bash",
                "regex",
            },
            sync_install = true,
            auto_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
