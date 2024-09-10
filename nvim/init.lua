local vim = vim -- to avoid undefined vim warning all down the file


----- Options -----
vim.o.termguicolors = true
vim.o.guicursor = '' -- Cursor is always block
vim.o.scrolloff = 8
vim.o.winbar = "%t" -- Show filename at the top of the buffers (https://www.youtube.com/watch?v=LKW_SUuc)
vim.o.laststatus = 3 -- Global statusline
vim.o.updatetime = 100
vim.o.timeoutlen = 500 -- Time to wait for keybinds to complete
vim.g.mapleader = ' ' -- Leader key
vim.g.maplocalleader = ' '
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.o.number = false -- Line numbers
vim.o.signcolumn = 'yes:1' -- Always display sign column
vim.opt.fillchars = { eob = ' ' } -- Hide tilde characters that identify non-existent lines
vim.o.wrap = false -- Line wrapping
vim.o.clipboard = 'unnamedplus' -- Enable system clipboard
vim.o.virtualedit = "block"
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.cursorline = true
----- Options -----





----- Plugins -----
local Plug = vim.fn['plug#']
vim.call('plug#begin')
-- tpope
Plug('tpope/vim-vinegar', {['frozen'] = true})
Plug('tpope/vim-commentary', {['frozen'] = true})
Plug('tpope/vim-surround', {['frozen'] = true})
Plug('tpope/vim-repeat', {['frozen'] = true})
Plug('tpope/vim-sleuth', {['frozen'] = true})
Plug('tpope/vim-unimpaired', {['frozen'] = true})
-- Git
Plug('tpope/vim-fugitive', {['frozen'] = true})
Plug('lewis6991/gitsigns.nvim', {['frozen'] = true})
Plug('kdheepak/lazygit.nvim', {['frozen'] = true})
-- Syntax tree parser, highlight, edit, and navigate code
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate', ['frozen'] = true})
Plug('nvim-treesitter/nvim-treesitter-textobjects', {['frozen'] = true})
-- Language Server Protocol
Plug('neovim/nvim-lspconfig', {['frozen'] = true})
-- Snippets Engine
Plug('L3MON4D3/LuaSnip', {['tag'] = 'v2.*', ['do'] = 'make install_jsregexp', ['frozen'] = true})
-- Completions Engine
Plug('hrsh7th/nvim-cmp', {['frozen'] = true})
-- Icons
Plug('nvim-tree/nvim-web-devicons', {['frozen'] = true})
-- Completions Sources
Plug('hrsh7th/cmp-nvim-lsp', {['frozen'] = true})
Plug('hrsh7th/cmp-nvim-lsp-signature-help', {['frozen'] = true})
Plug('hrsh7th/cmp-path', {['frozen'] = true})
Plug('saadparwaiz1/cmp_luasnip', {['frozen'] = true})
-- Formatting
Plug('stevearc/conform.nvim', {['frozen'] = true})
-- Linting
Plug('mfussenegger/nvim-lint', {['frozen'] = true})
-- Telescope
Plug('nvim-lua/plenary.nvim', {['frozen'] = true})
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8', ['frozen'] = true})
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make', ['frozen'] = true})
-- Utils
Plug('stevearc/dressing.nvim', {['frozen'] = true})
Plug('NvChad/nvim-colorizer.lua', {['frozen'] = true})
vim.call('plug#end')
----- Plugins -----





----- Your own statusline -----
vim.cmd([[
    function! GitBranch()
      if exists('b:gitsigns_head')
        return ' ' . b:gitsigns_head . ' '
      endif
      return ''
    endfunction

    set statusline=%#Comment#%{GitBranch()}
    set statusline+=%m
    set statusline+=%=
    set statusline+=line\ %l\ out\ of\ %L,\ column\ %c%0*
]])
----- Your own statusline -----





----- Small plugin setups -----
-- Icons
require('nvim-web-devicons').setup({color_icons = false})
-- Colorizer
require("colorizer").setup({})
-- GitSigns
require('gitsigns').setup()
-- Change diagnostic signs
vim.cmd('call sign_define("DiagnosticSignError", {"text": "✱", "texthl": "DiagnosticSignError"})')
vim.cmd('call sign_define("DiagnosticSignWarn", {"text": "✱", "texthl": "DiagnosticSignWarn"})')
vim.cmd('call sign_define("DiagnosticSignInfo", {"text": "✱", "texthl": "DiagnosticSignInfo"})')
vim.cmd('call sign_define("DiagnosticSignHint", {"text": "✱", "texthl": "DiagnosticSignHint"})')
-- LazyGit
vim.g.lazygit_floating_window_scaling_factor = 0.95
vim.g.lazygit_floating_window_border_chars = {'┌', '─', '┐', '│', '┘', '─', '└', '│'}
----- Small plugin setups -----





----- Treesitter -----
-- Defer setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash' },

    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = false,
    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- List of parsers to ignore installing
    ignore_install = {},
    -- You can specify additional Treesitter modules here: -- For example: -- playground = {--enable = true,-- },
    modules = {},
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      -- TODO: Переделать шорткаты
      -- keymaps = {
      --   init_selection = '<c-space>',
      --   node_incremental = '<c-space>',
      --   scope_incremental = '<c-s>',
      --   node_decremental = '<M-space>',
      -- },
    },
  }
end, 0)
----- Treesitter -----





----- LSP -----
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

-- TODO: Попробовать переписать более лаконично
-- Limit hover pop-up width
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or 'single'
  opts.max_width= opts.max_width or 100
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
----- LSP -----





----- Telescope -----
local putils = require("telescope.previewers.utils")
local conf = require('telescope.config').values
local actions = require("telescope.actions")
require('telescope').setup({
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case", the default case_mode is "smart_case"
      override_generic_sorter = true,
      override_file_sorter = true,
    }
  },
  defaults = {
    color_devicons = false,
    vimgrep_arguments = table.insert(conf.vimgrep_arguments, '--fixed-strings'), -- Disable regexp
    layout_strategy = 'vertical',
    layout_config = { height = 0.98, width = 0.95 },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-h>"] = "which_key"
      }
    },
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    preview = {
        -- 1) Do not show previewer for certain files
        filetype_hook = function(filepath, bufnr, opts)
          -- you could analogously check opts.ft for filetypes
          local excluded = vim.tbl_filter(function(ending)
            return filepath:match(ending)
          end, {
            ".*%.csv",
            ".*%.toml",
            ".*%.min.js",
          })
          if not vim.tbl_isempty(excluded) then
            putils.set_preview_message(
              bufnr,
              opts.winid,
              string.format("Do not preview %s files",
              excluded[1]:sub(5, -1))
            )
            return false
          end
          return true
        end
      }
  }
})
require('telescope').load_extension('fzf') -- We need to call load_extension, somewhere after setup function
----- Telescope -----





----- Formatting -----
local conform_util = require('conform.util')
require("conform").setup({
  format_after_save = {
    async = true
  },
  notify_on_error = false,
  notify_no_formatters = false,
  formatters_by_ft = {
    javascript = { 'biome', 'prettier' },
    javascriptreact = { 'biome', 'prettier' },
    typescript = { 'biome', 'prettier' },
    typescriptreact = { 'biome', 'prettier' }
  },
  formatters = {
    prettier = {
      require_cwd = true,
      cwd = conform_util.root_file({
        ".prettierrc",
        ".prettierrc.json",
        ".prettierrc.yml",
        ".prettierrc.yaml",
        ".prettierrc.json5",
        ".prettierrc.js",
        ".prettierrc.cjs",
        ".prettierrc.mjs",
        ".prettierrc.toml",
        "prettier.config.js",
        "prettier.config.cjs",
        "prettier.config.mjs"
      })
    }
  }
})
----- Formatting -----





----- Key Bindings -----
-- Sorry, not sorry
vim.keymap.set('n', '<C-a>', '^')
vim.keymap.set('n', '<C-e>', '$')
-- Paste without yanking
vim.keymap.set('x', 'p', 'P')
-- Continuous Indentation
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
-- Move to Split
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
-- Create Split
vim.keymap.set('n', '<C-M-h>', '<C-w>v')
vim.keymap.set('n', '<C-M-j>', '<C-w>s')
vim.keymap.set('n', '<C-M-k>', '<C-w>s')
vim.keymap.set('n', '<C-M-l>', '<C-w>v')
-- Close Split
vim.keymap.set('n', '<C-w>', '<C-w>q', {nowait = true})
-- Telescope
local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>r', telescope_builtin.resume, {})
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})
vim.keymap.set('n', 'gd', telescope_builtin.lsp_definitions, {}) -- To go back C-t may be useful! (go back in Tag Stack)
vim.keymap.set('n', 'gr', telescope_builtin.lsp_references, {})
-- LazyGit
vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>', {})
----- Key Bindings -----





----- Your own colorscheme  -----
vim.cmd('colorscheme halftone') -- :Inspect to check highlighting under the cursor
----- Your own colorscheme -----
