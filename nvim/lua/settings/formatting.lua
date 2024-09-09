local conform_util = require('conform.util')
require("conform").setup({
  -- NOTE: Если будет странное поведение, то попробовать format_on_save без async'а
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
        "prettier.config.mjs",
      })
    }
  }
})
