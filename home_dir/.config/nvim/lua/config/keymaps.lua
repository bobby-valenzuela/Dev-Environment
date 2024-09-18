-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- -- ~/.config/nvim/lua/keymaps.lua or wherever your keymaps are configured
-- Map Ctrl+b to enter visual-block mode
vim.keymap.set('n', '<C-b>', '<C-v>', { noremap = true, silent = true })

