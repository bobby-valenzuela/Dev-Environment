-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- -- ~/.config/nvim/lua/keymaps.lua or wherever your keymaps are configured


-- Map Ctrl+b to enter visual-block mode
vim.keymap.set('n', '<C-b>', '<C-v>', { noremap = true, silent = true })

-- 'Git Undo' | Undo last commit and set changes as staged and unsaved
vim.keymap.set('n', '<leader>gu', '<cmd>git reset --hard HEAD~1<CR>', { desc= 'Undo last commit', noremap = true, silent = true })

-- 'Git stash' | Stash current changes using no custom stash name
vim.keymap.set('n', '<leader>gS', '<cmd>git stash save<CR>', { desc= 'Git stash', noremap = true, silent = true })

-- 'Remove Markers' | Remove all markers
vim.keymap.set('n', '<leader>rm', ':delm a-zA-Z0-9<CR>', { desc= 'Remove All Markers', noremap = true, silent = true })
