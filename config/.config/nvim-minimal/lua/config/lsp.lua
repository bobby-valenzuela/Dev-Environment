--
-- THIS FORMAT WORKS WITH NEOVIM 0.10
-- local lspconfig = require("lspconfig")
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
-- local servers = {
--   pyright = {},
--   ts_ls = {},
--   bashls = {},
--   clangd = {},
--   perlnavigator = {},
--   lua_ls = {
--     settings = {
--       Lua = {
--         diagnostics = {
--           globals = { "vim" },
--         },
--       },
--     },
--   },
--   html = {},
--   cssls = {},
-- }
--
-- for name, opts in pairs(servers) do
--   opts.capabilities = capabilities
--   lspconfig[name].setup(opts)
-- end


-- REQUIRES NEOVIM 0.11+
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- 
-- -- Define server configurations
-- local servers = {
  -- pyright = {},
  -- ts_ls = {},
  -- bashls = {},
  -- clangd = {},
  -- perlnavigator = {},
  -- lua_ls = {
    -- settings = {
      -- Lua = {
        -- diagnostics = {
          -- globals = { "vim" },
        -- },
      -- },
    -- },
  -- },
  -- html = {},
  -- cssls = {},
-- }
-- 
-- -- Enable each LSP server with its configuration
-- for name, opts in pairs(servers) do
  -- local config = vim.tbl_deep_extend("force", { capabilities = capabilities }, opts)
  -- vim.lsp.enable(name, config)
-- end
