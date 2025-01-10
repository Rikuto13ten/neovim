local language = {
  'lua',
  'kotlin',
  'scala',
  'haskell',
  'go',
  'json'
}

-- treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    language
  },
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
 },
  indent = {
    enable = true
  },
  autotag = {
    enable = true,
  },
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
