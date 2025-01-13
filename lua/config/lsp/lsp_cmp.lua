-- nvim-cmpの設定
local cmp = require("cmp")

-- 基本設定
local config = {
  -- スニペットエンジンの設定
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  -- 補完ソースの設定
  sources = {
    { name = "nvim_lsp" },          -- LSPによる補完
    { name = "render-markdown" },    -- Markdown補完
    -- 必要に応じて有効化
    -- { name = "buffer" },         -- バッファ内の単語を補完
    -- { name = "path" },           -- ファイルパスの補完
  },

  -- キーマッピング
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(), -- 前の候補を選択
    ["<C-n>"] = cmp.mapping.select_next_item(), -- 次の候補を選択
    ["<C-l>"] = cmp.mapping.complete(), -- 補完を手動で開始
    ["<C-e>"] = cmp.mapping.abort(), -- 補完をキャンセル
    ["<CR>"]  = cmp.mapping.confirm({ select = true }), -- 候補を確定
  }),

  -- 実験的機能
  experimental = {
    ghost_text = true, -- 未確定の補完をグレーテキストで表示
  },
}

-- 設定の適用
cmp.setup(config)
