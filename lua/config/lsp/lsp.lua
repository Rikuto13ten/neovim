local vim = vim

-- mason
require('mason').setup()

-- mason
require('mason-lspconfig').setup_handlers({
  -- セットアップ処理
  function(server_name)

    -- 補完機能を有効化
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local opt = {
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    }

    -- 各言語 LSP のセットアップ
    require('lspconfig')[server_name].setup(opt)
  end
})



-- lsp に関する keybind
require 'config/lsp/lsp_keybind'

-- 診断メッセージ
require 'config/lsp/lsp_diagnost'

-- 補完関係
require 'config/lsp/lsp_cmp'

-- lsp_treesitter の設定
require 'config/lsp/lsp_treesitter'
