-- keybind
local function key_map(mode, key, command)
  vim.keymap.set(mode, key, command)
end
key_map('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
key_map('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
key_map('n', 'gi', '<cmd>lua vim.lsp.buf.references()<CR>')
key_map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
key_map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
key_map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
key_map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
key_map('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>')
key_map('n', 'gq', '<cmd>lua vim.lsp.buf.code_action()<CR>')
key_map('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
key_map('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
key_map('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
