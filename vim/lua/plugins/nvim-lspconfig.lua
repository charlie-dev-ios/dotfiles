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

    require'lspconfig'.lua_ls.setup {
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
            return
          end
        end
        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- Depending on the usage, you might want to add additional paths here.
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        })
      end,
      settings = {
        Lua = {}
      }
    }
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
