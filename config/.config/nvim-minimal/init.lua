-- Ensure ~/.config/nvim-minimal/ is in runtimepath
vim.opt.runtimepath:prepend(vim.fn.stdpath('config'))

vim.g.mapleader = " "  -- Sets <Space> as the leader key

-- Load the lazy.nvim plugin manager (this will also load plugin configurations from plugins/)
require('config.lazy')

-- Load core configurations from the config/ directory
require('config.keymaps')      -- Load key mappings
require('config.options')      -- Load Neovim options

-- Load LSP system
require("config.mason")
require("config.lsp")
require("config.cmp")
