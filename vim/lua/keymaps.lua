---------------------------------------
-- キーマップ
---------------------------------------

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }

vim.g.mapleader = ' '

map('i', 'jj', '<Esc>', opts)
map('n', '<Esc><Esc>', ':nohlsearch<CR>', opts)

-- ウィンドウ分割
map('n', 's', '<C-w>', opts)
map('n', '<C-w>v', '<C-w>s', opts)
map('n', '<C-w>s', 'jC-w>v', opts)
map('n', 'sv', '<C-w>s', opts)
map('n', 'ss', '<C-w>v', opts)
map('n', 's<', '4<C-w><', opts)
map('n', 's>', '4<C-w>>', opts)
map('n', 's+', '4<C-w>+', opts)
map('n', 's-', '4<C-w>-', opts)

-- ファイルエクスプローラー
map('n', ':E', ':Ex', opts)

-- バッファ
map('n', 'T', ':Tex<CR>', opts)
map('n', 'tl', 'gt', opts)
map('n', 'th', 'gT', opts)

-- 設定ファイルの読み込み
local configPath = vim.fn.stdpath('config') .. '/init.lua'
map(
    'n', '<Leader>config',
    ':source ' .. configPath .. '<CR>', opts
)

-- barbar.nvim
map('n', '<Leader>l', '<Cmd>BufferNext<CR>', opts)
map('n', '<Leader>h', '<Cmd>BufferPreviou<CR>', opts)
map('n', '<Leader>bp', '<Cmd>BufferPick<CR>', opts)
map('n', '<Leader>bc', '<Cmd>BufferClose<CR>', opts)
map('n', '<Leader>bac', '<Cmd>BufferCloseAllButCurrentOrPinned<CR>', opts)
