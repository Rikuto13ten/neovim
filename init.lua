require 'keymap'
require 'plugins'
require 'config/mason'


vim.o.showtabline = 0
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.number = true
vim.o.autoindent = true
vim.o.ignorecase = true
vim.o.textwidth = 160
vim.wo.cursorline = true

vim.opt.list = true
vim.opt.listchars = { tab = '->', space = '･', eol = '¬', trail = '-' }

vim.g.loaded_devicons = true
vim.g.devicons_enable = true
vim.g.indent_blankline_enabled = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--------------------------------
-- theme
--------------------------------
vim.cmd('syntax on')
vim.cmd('colorscheme iceberg')

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
