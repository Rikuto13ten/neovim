require 'config/lsp_config'
require 'config/lsp_cmp_config'
require 'config/lsp_treesitter'
------------------------
-- if status
------------------------
local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end
------------------------
-- document_highlight
------------------------

-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  update_in_insert = false,
  virtual_text = {
    format = function (diagnostic)
      return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
    end
  },
})
