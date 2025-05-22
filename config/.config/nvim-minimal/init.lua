-- Ensure ~/.config/nvim-minimal/ is in runtimepath
vim.opt.runtimepath:prepend(vim.fn.stdpath('config'))

-- Load core configurations from the config/ directory
require('config.options')      -- Load Neovim options
require('config.keymaps')      -- Load key mappings
-- require('config.autocommands') -- Load autocommands

-- Load the lazy.nvim plugin manager (this will also load plugin configurations from plugins/)
require('config.lazy')
