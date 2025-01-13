local set = vim.keymap.set
vim.g.mapleader = " "

set( 'i', 'jj', '<Esc>')
set( 'n', '<Leader>q', ':q<CR>' )

-- move window
set( 'n', '<Leader>h', '<C-w>h' )
set( 'n', '<Leader>j', '<C-w>j' )
set( 'n', '<Leader>k', '<C-w>k' )
set( 'n', '<Leader>l', '<C-w>l' )

-- create window
set( 'n', '<Leader>wj', '<C-w>s' ) -- 右に window 作成
set( 'n', '<Leader>wl', '<C-w>v' ) -- 下に window 作成

-- Fern
set( 'n', '<Leader>e', ':Fern . -reveal=% -drawer -toggle -width=40<CR>' ) -- 開く

-- terminal 
set( 't', '<Esc>', '<C-\\><C-n>', { noremap = true } ) -- mode 中に normal modeにする
set( 'n', '<Leader>tt', ':terminal<CR>' ) -- terminal を開く

-- jumpcursor
set( 'n', '<Leader>s', '<Plug>(jumpcursor-jump)')

-- window size
set( 'n', '<Leader>ww+', ':vertical resize +10<CR>' )
set( 'n', '<Leader>ww-', ':vertical resize -10<CR>' )
set( 'n', '<Leader>wh+', ':resize +10<CR>' )
set( 'n', '<Leader>wh-', ':resize -10<CR>' )

-- save
set( 'n', '<C-s>', ':w<CR>' )

