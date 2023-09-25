------------------------
-- Mason_setup
------------------------
require('mason').setup()

------------------------
-- Mason_lspconfig
------------------------
require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
    capabilities = require('cmp_nvim_lsp').default_capabilities() } require('lspconfig')[server].setup(opt)
end })

------------------------
-- if status
------------------------
local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

------------------------
-- protocol
------------------------
local protocol = require('vim.lsp.protocol')

------------------------
-- document_highlight
------------------------
local on_attach = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd('augroup lsp_document_highlight')
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() 
        vim.lsp.buf.formatting_seq_sync()
      end
    })
  end
end

------------------------
-- tsserver
------------------------
require'lspconfig'.tsserver.setup{
  on_attach = on_attach,
  capabilities = {
    textDocument = {
      documentHighlight = true
    }
  }
}

local language = {
  'lua',
  'typescript',
  'go',
  'json',
  'toml',
  'tsx',
  'rust',
  'html',
  'css',
  'javascript',
  'kotlin',
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

------------------------------
-- lsp language
------------------------------

--kotlin
nvim_lsp.kotlin_language_server.setup {
  on_attach = on_attach
}

--lua
nvim_lsp.lua_ls.setup {
  on_attach = on_attach,
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
}

--vim
nvim_lsp.vimls.setup {
  on_attach = on_attach
}

-- typescript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

-- Html lsp
nvim_lsp.html.setup {
  on_attach = on_attach,
  capabilities = {
    textDocument = {
      documentHighlight = true
    }
  }
}

-- Rust lsp
nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
      },
      cargo = {
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      },
      checkOnSave = {
        command = "clippy"
      }
    }
  }
}

-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)

vim.cmd [[
set updatetime=100
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
augroup lsp_document_highlight
autocmd!
autocmd CursorHold, CursorHoldI * lua vim.lsp.buf.document_highlight()
autocmd CursorMoved, CursorMovedI, CursorHold * lua vim.lsp.buf.clear_references()
augroup END
]]

-- 3. completion (hrsh7th/nvim-cmp)
local cmp = require("cmp")
local lspkind = require('lspkind')

cmp.setup({
  -- snippet
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  -- formatting
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 100,
      ellipsis_char = '...',
      before = function (entry, vim_item)
        return vim_item
      end
    })
  },

  -- sources
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },

  -- mapping
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
  }),

  -- experimental
  experimental = {
    ghost_text = true,
  },
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
      {
        name = 'cmdline',
        option = {
          ignore_cmds = { 'Man', '!' }
        }
      }
    })
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  update_in_insert = false,
  virtual_text = {
    format = function (diagnostic)
      return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
    end
  },
})
