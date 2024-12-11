---------------------------------------
-- キーマップ
---------------------------------------

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }

vim.g.mapleader = ' '

map('i', 'jj', '<Esc>', opts)
map('n', '<Esc><Esc>', ':nohlsearch<CR>', opts)

-- ウィンドウ分割
map('n', '<Leader>s', '<C-w>', opts)
map('n', '<Leader>s<', '4<C-w><', opts)
map('n', '<Leader>s>', '4<C-w>>', opts)
map('n', '<Leader>s+', '4<C-w>+', opts)
map('n', '<Leader>s-', '4<C-w>-', opts)

-- 設定ファイルの読み込み
local configPath = vim.fn.stdpath('config') .. '/init.lua'
map(
    'n', '<Leader>0',
    ':source ' .. configPath .. '<CR>', opts
)

