return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufNewFile", "BufRead" },
    ---@module "ibl"
    ---@type ibl.config
    opts = {
       indent = {
           char = "╎",
       },
    },
}

