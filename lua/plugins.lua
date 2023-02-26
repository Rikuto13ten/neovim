vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
  use 'wbthomason/packer.nvim'

  ---------------------
  -- lsp
  ---------------------
  use 'lukas-reineke/indent-blankline.nvim'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/vim-vsnip"
  -- use "hrsh7th/cmp-path"
  -- use "hrsh7th/cmp-buffer"
  -- use "hrsh7th/cmp-cmdline"
  

  ----------------------------------------------------
  -- fern
  ----------------------------------------------------
  use 'lambdalisue/fern.vim'


  ----------------------------------------------------
  -- telescope
  ----------------------------------------------------
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }


  ----------------------------------------------------
  -- Hop Word
  -- https://github.com/phaazon/hop.nvim
  ----------------------------------------------------
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }


  ----------------------------------------------------
  -- which-key.nvim
  ----------------------------------------------------
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
      }
    end
  }


  ----------------------------------------------------
  -- ddc
  ----------------------------------------------------
  use 'Shougo/ddc.vim'


  ----------------------------------------------------
  -- theme
  ----------------------------------------------------
  use {
    'ellisonleao/gruvbox.nvim',
    require("gruvbox").setup({
      italic = false
    })
  }


end)
