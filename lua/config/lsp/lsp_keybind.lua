-- keybind
local function map(key, command, description)
  vim.keymap.set('n', key, command, description)
end
map('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', 'gi', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', 'gq', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
map('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
map('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')