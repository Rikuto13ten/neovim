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
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- lsp
  { "neovim/nvim-lspconfig" },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
  },
  { "williamboman/mason-lspconfig.nvim" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/vim-vsnip" },
  { "hrsh7th/cmp-cmdline" },
  { "onsails/lspkind.nvim" },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  -- theme
  { "cocopon/iceberg.vim" },

  -- nvim-neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VimEnter",
    branch = "main",
    config = function()
      require("neo-tree").setup({
      })
    end
  },

  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" }, -- not strictly required, but recommended
  { "MunifTanjim/nui.nvim" },

  -- telescope
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

  -- hop
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },

  -- null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function ()
      require('null-ls').setup({
        diagnotics_format = "#{m} (#{s}: #{c})",
      })
    end
  },

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
})
