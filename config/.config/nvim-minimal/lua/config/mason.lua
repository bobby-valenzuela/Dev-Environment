require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "pyright",        -- Python
    "tsserver",       -- JavaScript/TypeScript
    "bashls",         -- Bash
    "clangd",         -- C/C++
    "perlnavigator",  -- Perl
    "lua_ls",         -- Lua
    "html",
    "cssls",
  },
})
