require('mason').setup()

require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
    capabilities = require('cmp_nvim_lsp').default_capabilities()
  }
  local nvim_lsp = require('lspconfig')
  -- lsp
  nvim_lsp[server].setup(opt)
  nvim_lsp.tsserver.setup(opt)
  nvim_lsp.kotlin_language_server.setup(opt)
  nvim_lsp.lua_ls.setup(opt)
end })

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd('augroup lsp_document_highlight')
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() 
        vim.lsp.buf.formatting_seq_sync()
      end
    })
  end
end
