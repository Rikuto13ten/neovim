local language = {
  'lua',
  'go',
  'json',
  'nix'
}

-- treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    language
  },
  sync_install = true, -- パーサーを同期的にインストール
  auto_install = true, -- 言語パーサーを自動的にインストール

  -- 構文ハイライト
  highlight = {
    enable = true,
  },

  -- インデント
  indent = {
    enable = true
  },

  -- 自動タグ閉じ
  autotag = {
    enable = true,
  },

  -- 括弧
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000,
  },
  context_commentstring = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
    },
    move = {
      enable = true,
      set_jumps = true,
    },
  }
}
