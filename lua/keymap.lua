local set = vim.keymap.set

-- move window
vim.g.mapleader = " "
set( 'n', '<Leader>', '' )
set( 'n', '<Leader>h', '<C-w>h' )
set( 'n', '<Leader>j', '<C-w>j' )
set( 'n', '<Leader>k', '<C-w>k' )
set( 'n', '<Leader>l', '<C-w>l' )

set( 'n', '<Leader>fg', ':Telescope live_grep<CR>' ) -- Telescope
set( 'n', '<Leader>fe', ':Telescope find_files<CR>' ) -- Telescope
set( 'n', '<Leader>p', ':Telescope commands<CR>' ) -- Telescope
set( 'n', '<Leader>e', ':Fern . -reveal=% -drawer -toggle<CR>' ) -- Fern
set( 'n', '<Leader>wj', '<C-w>s' ) -- Fern
set( 'n', '<Leader>wl', '<C-w>v' ) -- Fern

set( 't', '<Esc>', '<C-\\><C-n>', { noremap = true } )

set( 'n', '<Leader>s', ':HopWord<CR>')
