-- TODO: Захардкодить пути к проектам в которых должен работать форматтер

-- require("conform").setup({
--   formatters_by_ft = {
--     javascript = { "biome" }
--   },
-- })

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args)
--     require("conform").format({ bufnr = args.buf })
--   end,
-- })
