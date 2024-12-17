return {
  'rmagatti/auto-session',
  lazy = false,
  keys = {
      { "<Leader>ws", "<cmd>SessionSave<CR>" },
      { "<Leader>wr", "<cmd>SessionRestore<CR>" },
      { "<Leader>wd", "<cmd>SessionDelete<CR>" },
  },
  config = function()
      local auto_session = require("auto-session")

      local function restore_nvim_tree()
          require("nvim-tree.api").tree.open({})
      end

      auto_session.setup({
          auto_save = true,
          auto_restore = false,
          suppressed_dirs = { 
              '~/',
          },
          post_restore_cmds = { restore_nvim_tree },
      })
  end,
}
