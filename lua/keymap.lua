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
set( 'n', '<Leader>wj', '<C-w>s' )
set( 'n', '<Leader>wl', '<C-w>v' )

-- Telescope
set( 'n', '<Leader>fg', ':Telescope live_grep<CR>' ) -- Telescope
set( 'n', '<Leader>fe', ':Telescope find_files<CR>' ) -- Telescope
set( 'n', '<Leader>fp', ':Telescope commands<CR>' ) -- Telescope

-- Fern
set( 'n', '<Leader>e', ':Fern . -reveal=% -drawer -toggle -width=40<CR>' ) -- Fern

set( 't', '<Esc>', '<C-\\><C-n>', { noremap = true } )

-- HopWord
set( 'n', '<Leader>s', '<Plug>(jumpcursor-jump)')

-- window size
set( 'n', '<Leader>ww+', ':vertical resize +10<CR>' )
set( 'n', '<Leader>ww-', ':vertical resize -10<CR>' )
set( 'n', '<Leader>wh+', ':resize +10<CR>' )
set( 'n', '<Leader>wh-', ':resize -10<CR>' )

-- save
set( 'n', '<C-s>', ':w<CR>' )

-- terminal
set( 'n', '<Leader>tt', ':terminal<CR>' )
