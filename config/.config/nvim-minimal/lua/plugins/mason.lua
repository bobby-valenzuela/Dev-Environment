return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  config = true,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    version = "1.29.0", -- last version that supports Neovim 0.10
  },
}
