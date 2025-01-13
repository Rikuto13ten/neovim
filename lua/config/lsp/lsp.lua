local vim = vim

-- mason
require('mason').setup()

-- mason
require('mason-lspconfig').setup_handlers({
  -- セットアップ処理
  function(server_name)
    -- LSP の基本設定
    local lsp_config = require('lspconfig')

    -- 補完機能を有効化
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local opt = {
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    }

    -- 各言語 LSP のセットアップ
    lsp_config[server_name].setup(opt)
  end
})

-- lsp に関する keybind
require 'config/lsp/lsp_keybind'

-- 診断メッセージ
require 'config/lsp/lsp_diagnost'

-- 補完関係
require 'config/lsp/lsp_cmp'
