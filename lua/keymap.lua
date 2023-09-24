local set = vim.keymap.set
vim.g.mapleader = " "

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
set( 'n', '<Leader>s', ':HopWord<CR>')

-- window size
set( 'n', '<Leader>ww+', ':vertical resize +10<CR>' )
set( 'n', '<Leader>ww-', ':vertical resize -10<CR>' )
set( 'n', '<Leader>wh+', ':resize +10<CR>' )
set( 'n', '<Leader>wh-', ':resize -10<CR>' )

-- save
set( 'n', '<C-s>', ':w<CR>' )

-- terminal
set( 'n', '<Leader>tt', ':terminal<CR>' )

-- lsp
set('n', 'gk', '<cmd>Lspsaga hover_doc<CR>')
set('n', 'gr', '<cmd>Lspsaga rename<CR>')
set('n', 'ga', '<cmd>Lspsaga code_action<CR>')
set('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>')
set('n', 'go', '<cmd>Lspsaga outline<CR>')
set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
