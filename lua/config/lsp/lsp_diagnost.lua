-- LSP の診断メッセージの表示設定
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {

    -- 仮想テキストとして表示される format
    virtual_text = {
      format = function(diagnostic)
        return string.format(
          "%s (%s: %s)",
          diagnostic.message,
          diagnostic.source,
          diagnostic.code
        )
      end
    }
  }
)
