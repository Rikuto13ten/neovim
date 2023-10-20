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
  nvim_lsp.hls.setup(opt)
end })
