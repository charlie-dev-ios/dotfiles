---------------------------------------
-- 基本設定
---------------------------------------

local opt = vim.opt

-- 行数
opt.number = true

-- 検索時に大文字と小文字を区別しない
opt.ignorecase = true

-- 検索時に大文字を含む場合のみ大文字と小文字を区別する
opt.smartcase = true

-- 検索で入力中に部分一致をハイライトするかどうか
opt.incsearch = true

-- タブの表示幅
opt.tabstop = 4

-- ソフトタブの幅
opt.softtabstop = 4

-- インデントの幅
opt.shiftwidth = 4

-- 自動インデントを使用するかどうか
opt.smartindent = true

-- タブをスペースに展開するかどうか
opt.expandtab = true

-- 新しい行を現在の行のインデントと同じにする
opt.autoindent = false

-- 長い行を画面端で折り返すかどうか
opt.wrap = true

-- 単語単位での折り返しを行うかどうか
opt.linebreak = false

-- カーソルの行をハイライトするかどうか
opt.cursorline = true

-- カーソルの列をハイライトするかどうか
opt.cursorcolumn = false

-- モードを画面下に表示
opt.showmode = true

-- ファイルが外部で更新された時に自動で再読み込みするかどうか
opt.autoread = true

-- システムクリップボードを使用
opt.clipboard:append({"unnamedplus"})

-- マウス操作の有効化
opt.mouse = a
