-- LSP
local lspconfig = require('lspconfig')
local lsp_servers = {}
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- HTML (npm i -g vscode-langservers-extracted)
-- HTML server only provides completions when snippet support is enabled (https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html)
local capabilities_for_html = vim.lsp.protocol.make_client_capabilities()
capabilities_for_html.textDocument.completion.completionItem.snippetSupport = true
require('lspconfig').html.setup {
  capabilities = capabilities_for_html,
}

-- CSS (npm i -g vscode-langservers-extracted)
local capabilities_for_css = vim.lsp.protocol.make_client_capabilities()
capabilities_for_css.textDocument.completion.completionItem.snippetSupport = true
require('lspconfig').cssls.setup {
  capabilities = capabilities_for_css,
}

-- TypeScript
-- Give TypeScript server more memory (5GB instead of default 3GB)
require('lspconfig').vtsls.setup({
  settings = { typescript = { tsserver = { maxTsServerMemory = 5120 }}},
  capabilities = cmp_capabilities
})

-- CSS Modules (npm install -g cssmodules-language-server)
local servers = { 'cssmodules_ls' }
for _, lsp_server in ipairs(servers) do
  lspconfig[lsp_server].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = cmp_capabilities
  }
end

-- Completions
local cmp = require('cmp')

-- NERD font and nvim-web-devicons are required to see the icons
local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}

cmp.setup({
  formatting = {
    fields = { "kind", "abbr" },
    format = function(entry, vim_item)
      vim_item.kind = kind_icons[vim_item.kind] or ""
      return vim_item
    end
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = {
      border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
    },
    documentation = {
      border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
    }
  },
  -- TODO: Переделать шорткаты
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-Space>'] = cmp.mapping.complete(),
    -- ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' },
    { name = 'path' }
  })
})
