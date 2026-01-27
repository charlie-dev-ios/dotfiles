---------------------------------------
-- autocmd
---------------------------------------

---------------------------------------
-- Diagnostics設定
---------------------------------------
vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
    spacing = 2,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.HINT] = '',
      [vim.diagnostic.severity.INFO] = '',
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = true,
  },
})

-- 診断キーマップ
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "前の診断へ" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "次の診断へ" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "診断をフロート表示" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "診断をロケーションリストへ" })

---------------------------------------
-- LSP
---------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }

    -- ナビゲーション
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gR", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

    -- 情報表示
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

    -- コードアクション
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>cf", function()
      vim.lsp.buf.format({ async = true })
    end, opts)

    -- Inlay Hints (Neovim 0.10+)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
      -- トグル用キーマップ
      vim.keymap.set("n", "<leader>th", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }), { bufnr = args.buf })
      end, opts)
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "swift",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})
