local cmp = require("cmp")
local lspkind = require('lspkind')

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

cmp.setup({
  -- snippet
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
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
    { name = "vsnip" },
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
