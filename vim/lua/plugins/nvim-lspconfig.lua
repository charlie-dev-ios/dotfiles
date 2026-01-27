return {
  "neovim/nvim-lspconfig",
  event = { "BufNewFile", "BufRead" },
  dependencies = { 'saghen/blink.cmp' },
  opts = {
    servers = {
      lua_ls = {},
      sourceKit = {}
    }
  },
  config = function(_, opts)
    local lspconfig = require('lspconfig')

    for server, config in pairs(opts.servers) do
      -- passing config.capabilities to blink.cmp merges with the capabilities in your
      -- `opts[server].capabilities, if you've defined it
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end

    -- lua_ls settings are handled by lazydev.nvim

    require'lspconfig'.sourcekit.setup {
      cmd = {
        'sourcekit-lsp',
        '-Xswiftc',
        '-sdk',
        '-Xswiftc',
        -- '`xcrun --sdk iphonesimulator --show-sdk-path`',
        '/Applications/Xcode16.3RC.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator18.4.sdk',
        '-Xswiftc',
        '-target',
        '-Xswiftc',
        -- 'x86_64-apple-ios`xcrun --sdk iphonesimulator --show-sdk-platform-version`-simulator',
        'x86_64-apple-ios18.5-simulator',
      },
    }
  end
}
