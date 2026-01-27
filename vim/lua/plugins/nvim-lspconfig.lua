return {
  "neovim/nvim-lspconfig",
  event = { "BufNewFile", "BufRead" },
  dependencies = { 'saghen/blink.cmp' },
  opts = {
    servers = {
      -- lua_ls settings are handled by lazydev.nvim
      lua_ls = {},
      -- TypeScript/JavaScript
      ts_ls = {},
      -- Swift (sourcekit-lsp)
      sourcekit = {
        cmd = {
          'sourcekit-lsp',
          '-Xswiftc', '-sdk',
          '-Xswiftc', '/Applications/Xcode16.3RC.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator18.4.sdk',
          '-Xswiftc', '-target',
          '-Xswiftc', 'x86_64-apple-ios18.5-simulator',
        },
      },
    }
  },
  config = function(_, opts)
    -- Neovim 0.11+ の vim.lsp.config API を使用
    for server, config in pairs(opts.servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      vim.lsp.config[server] = config
    end

    vim.lsp.enable(vim.tbl_keys(opts.servers))
  end
}
