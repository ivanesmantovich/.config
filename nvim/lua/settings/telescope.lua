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
