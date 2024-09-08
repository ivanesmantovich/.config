local vim = vim -- to avoid undefined vim warning all down the file


-- Options. :help vim.o
vim.o.termguicolors = true
vim.o.guicursor = '' -- Cursor is always block
vim.o.scrolloff = 8
vim.o.winbar = "%t" -- Show filename at the top of the buffers (https://www.youtube.com/watch?v=LKW_SUuc
vim.o.statusline = '%#Comment#%{FugitiveHead()}%0* %m%=line %l out of %L, column %c' -- %t is filename, 
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


-- TODO: Попробовать переписать более лаконично
-- Limit hover width
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or 'single'
  opts.max_width= opts.max_width or 100
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end


-- Plugins.
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


-- Small plugin setups
-- Icons
require('nvim-web-devicons').setup({})
-- Colorizer
require("colorizer").setup({})
-- GitSigns
require('gitsigns').setup()
-- LazyGit
vim.g.lazygit_floating_window_scaling_factor = 0.95
vim.g.lazygit_floating_window_border_chars = {'┌', '─', '┐', '│', '┘', '─', '└', '│'}


require('settings.treesitter')
require('settings.lsp')
require('settings.telescope')
require('settings.shortcuts')


-- Colorscheme. :Inspect to check highlighting under the cursor
vim.cmd('colorscheme halftone')
