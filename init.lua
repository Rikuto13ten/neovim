require 'keymap'
require 'plugins'
require 'config/lsp/lsp'
require 'config/lsp/null_ls'
require 'config/markdown/render-markdown-setup'

local vim = vim

--------------------------------
-- opt : vim のオプションを管理するために使用
--------------------------------
local opt = vim.opt

opt.showtabline = 0 -- editor tab を非表示
opt.shiftwidth = 2 -- インデントの幅
opt.tabstop = 2 -- tab の表示幅
opt.expandtab = true -- tab を space に変更
opt.smartindent = true -- 自動インデント
opt.autoindent = true -- 新しい行を現在の行のインデントと同じにする
opt.number = true -- 行番号の表示
opt.ignorecase = true -- 検索時に大文字・小文字を区別しない
opt.list = true -- 不可視文字を可視化
opt.listchars = { tab = '->', space = '･', eol = '¬', trail = '-' }
opt.wrap = false -- 折り返しはさせない

--------------------------------
-- wo
--------------------------------
vim.wo.cursorline = true

--------------------------------
-- g: グローバル変数
--------------------------------
vim.g.loaded_devicons = true
vim.g.devicons_enable = true
vim.g.indent_blankline_enabled = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g['fern#default_hidden'] = 1

--------------------------------
-- theme
--------------------------------
vim.cmd('syntax on')
vim.cmd('colorscheme catppuccin')
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
vim.cmd('hi NormalNC guibg=NONE ctermbg=NONE')
vim.cmd('hi VertSplit guibg=NONE ctermbg=NONE')
vim.cmd('hi EndOfBuffer guibg=NONE ctermbg=NONE')
vim.cmd('hi TermCursorNC guibg=NONE ctermbg=NONE')
vim.cmd('hi TermCursor guibg=NONE ctermbg=NONE')
vim.cmd('hi NonText guibg=NONE ctermbg=NONE')
vim.cmd('hi Folded guibg=NONE ctermbg=NONE')

--------------------------------
-- terminal mode
--------------------------------
vim.cmd [[
  augroup Terminal
    autocmd!
    autocmd TermOpen * startinsert
  augroup END

  command! -nargs=* T split | wincmd j | resize 20 | terminal <args>
]]

--------------------------------
-- command mode
--------------------------------
-- 上下矢印キーで補完候補を選択する
vim.cmd('cnoremap <expr> <Up> pumvisible() ? "\\<C-p>" : "\\<Up>"')
vim.cmd('cnoremap <expr> <Down> pumvisible() ? "\\<C-n>" : "\\<Down>"')
