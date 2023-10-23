local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end vim.opt.rtp:prepend(lazypath)

-- setup
require('lazy').setup({
  -- mason
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    opts = {},
  },
  -- mason-lspconfig
  {'williamboman/mason-lspconfig.nvim'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/nvim-cmp'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/vim-vsnip'},

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  --------------------------------------------
  -- iceberg
  --------------------------------------------
  { "cocopon/iceberg.vim" },

  --------------------------------------------
  -- fern
  --------------------------------------------
  {
	  'lambdalisue/fern.vim',
	  keys = {
		  { "<leader>e", ":Fern . -reveal=% -drawer -toggle -width=40<CR>", desc = "toggle fern" },
	  },
	  dependencies = {
		  { 'lambdalisue/nerdfont.vim', },
		  {
			  'lambdalisue/fern-renderer-nerdfont.vim',
			  config = function()
				  vim.g['fern#renderer'] = "nerdfont"
			  end
		  },
	  }
  },

  --------------------------------------------
  -- telescope
  --------------------------------------------
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
     require('telescope').setup({})
    end
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function ()
     require('telescope').load_extension "file_browser"
    end
  },

  -- which-key
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
      })
    end
  },

  -- auto pairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  },

  -- jumpcursor
  { 'skanehira/jumpcursor.vim' },
  -- indentscope
  {
    'echasnovski/mini.indentscope',
    version = false ,
    config = function ()
      require('mini.indentscope').setup({})
    end
  },

  -- auto save
  {
    "Pocco81/AutoSave.nvim",
    config = function()
      require("auto-save").setup{
        enabled = true,
        trigger_events = {"InsertLeave"},
        execution_message = {
          message = function()
            return ("auto save" .. vim.fn.strftime("%H:%M:%S"))
          end
        },
      }
    end
  },

  -- scala
  {
    "scalameta/nvim-metals",
    requires = { 'nvim-lua/plenary.nvim' },
  },

  -- nordic
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require 'nordic' .load()
    end
  },

  {
    "nvimtools/none-ls.nvim",
    dependencies = {"nvim-lua/plenary.nvim", "vim-test/vim-test"}
  },

  {
    'nvim-lua/plenary.nvim'
  },

  -- haskell_tools
{
  'mrcjkb/haskell-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  version = '^2', -- Recommended
  ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
  init = function()
    vim.g.haskell_tools = {
      hls = {
        default_settings = {
          haskell = {
            formattingProvider = 'ormolu'
          }
        }
      }
    }
  end,
}
})
