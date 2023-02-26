require 'plugins'
require 'keymap'
require 'config/mason'

vim.opt.showtabline = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.guifont = {"Iosevka Nerd Font Mono", "h12"}

--------------------------------
-- theme
--------------------------------
vim.cmd[[colorscheme gruvbox]]

--------------------------------
-- terminal mode
--------------------------------
vim.cmd[[
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
vim.cmd('cnoremap <expr> <Up>   pumvisible() ? "\\<C-p>" : "\\<Up>"')
vim.cmd('cnoremap <expr> <Down> pumvisible() ? "\\<C-n>" : "\\<Down>"')

-- 大文字小文字を区別しない
--
--
vim.o.ignorecase = true
vim.g.fern_default_hidden = 1
