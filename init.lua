require 'keymap'
require 'plugins'
require 'config/lsp/lsp'
require 'config/lsp/lsp_treesitter'
require 'config/lsp/null_ls'
require 'config/markdown/render-markdown-setup'

local vim = vim

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
vim.o.formatoptions = q

vim.wo.cursorline = true

vim.opt.list = true
vim.opt.listchars = { tab = '->', space = '･', eol = '¬', trail = '-' }
vim.opt.wrap = false

vim.g.loaded_devicons = true
vim.g.devicons_enable = true
vim.g.indent_blankline_enabled = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
