-- ------------------ SUMMARY -------------------
-- `<C-_>`: Open terminal in split windo
-- `<esc>`: Clear search highlights
-- `<C-b>`: Enter visual-block mode
-- `<leader>rm`: Remove all markers
-- `<leader><down><down>`: Move down 20 lines
-- `<leader><up><up>`: Move up 20 lines
-- `<F12>`: Next item in quickfix list
-- `<F11>`: Previous item in quickfix list
-- `<C-n>`: Toggle Neo-tree file explorer
-- `>`: Indent and keep visual selection
-- `<`: Unindent and keep visual selection
-- `<leader>ff`: Telescope find files
-- `<leader>fg`: Telescope live grep
-- `<leader>fb`: Telescope buffers
-- `<leader>fh`: Telescope help tags
-- `<leader>gu`: Undo last Git commit
-- `<leader>ga`: Stash current Git changes
-- `<leader>gg`: Open LazyGit for current file
-- `<leader>gt`: Toggle Git signs
-- `<leader>gs`: Open Git status
-- `<leader>gc`: Git commit
-- `<leader>gb`: Git blame
-- `<leader>gd`: Git diff
-- `<leader>go`: Open file in remote (e.g., GitHub)
-- `<leader>gl`: Git commit log
-- `<leader>ie`: Enable Snacks indent
-- `<leader>id`: Disable Snacks indent
-- `gd`: Go to definition
-- `gD`: Go to declaration
-- `gr`: Find references
-- `K`: Show hover documentation
-- `<C-k>`: Show function signature help
-- `<leader>rn`: Rename symbol
-- `<leader>ca`: Apply code actions
-- `<leader>f`: Format code
-- `]d`: Next diagnostic
-- `[d`: Previous diagnostic
-- `<leader>e`: Open diagnostic float
-- `<leader>ws`: Search workspace symbols
-- `gi`: Go to implementation
-- `<leader>q`: List diagnostics in quickfix
-- `<leader>lr`: Restart LSP
-- `<leader>li`: Show LSP info
-- `<leader>dd`: Disable diagnostics for buffer
-- `<leader>de`: Enable diagnostics for buffer
-- `<leader>dl`: Disable diagnostics for current line
-- `<leader>dL`: Enable diagnostics for current line
-- Keymaps are automatically loaded on the VeryLazy event

-- :args - but assumes recursive
vim.keymap.set('n', '<leader>FF', function()
    -- Prompt for a file pattern
    local pattern = vim.fn.input('rargs: ')
    if pattern ~= '' then
        -- Prepend **/ and execute :args
        vim.cmd('args **/' .. vim.fn.escape(pattern, ' '))
        vim.fn.setqflist({}, 'r') -- Clear quickfix list
        local args = vim.fn.argv() -- Get argument list
        local qflist = {}
        for _, file in ipairs(args) do
            if not file:match('%.swp$') then -- Skip .swp files
                table.insert(qflist, { filename = vim.fn.expand(file, ':p'), lnum = 1, col = 1 })
            end
        end
        vim.fn.setqflist(qflist, 'a') -- Add entries to quickfix list
        vim.cmd('copen') -- Open quickfix window
    end
end, { noremap = true, silent = true })




-- Toggle line numbering
vim.keymap.set('n', '<Leader>ll', 'set nonumber norelativenumber', { noremap = true, silent = true })

-- Integrated Terminal 
vim.keymap.set('n', '<C-_>', ':split | resize 15 | set nonumber norelativenumber | terminal<CR> | i', { noremap = true, silent = true })

-- Escape key impled :nohl (as well as leader+h to unhighlight)
vim.keymap.set('n', '<esc>', ':nohlsearch<CR><esc>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR><esc>', { noremap = true, silent = true })

-- Map Ctrl+b to enter visual-block mode
vim.keymap.set('n', '<C-b>', '<C-v>', { noremap = true, silent = true })

-- 'Remove Markers' | Remove all markers
vim.keymap.set('n', '<leader>rm', ':delm a-zA-Z0-9<CR>', { desc= 'Remove All Markers', noremap = true, silent = true })

-- move up/down in 20-step jumps
vim.keymap.set('n', '<leader><down><down>', '20<C-e>', { desc= 'Move down 20 steps', noremap = true, silent = true })
vim.keymap.set('n', '<leader><up><up>', '20<C-y>', { desc= 'Move down 20 steps', noremap = true, silent = true })

-- Quickfix nav shortcuts
vim.keymap.set('n', '<F12>', ':cn<CR>', { desc= 'Next item in quickfix list', noremap = true, silent = true })
vim.keymap.set('n', '<F11>', ':cp<CR>', { desc= 'Previous item in quickfix list', noremap = true, silent = true })

-- Neotree
vim.keymap.set('n', '<leader><leader>', ':Neotree toggle<CR>', { desc = 'Toggle Neo-tree file explorer', noremap = true, silent = true })

-- Remap > to indent and keep visual selection
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

-- Remap < to unindent and keep visual selection
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })

-- _______________________ Telescope __________________________
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })



-- _______________________ Git (General) __________________________
-- 'Git Undo' | Undo last commit and set changes as staged and unsaved
vim.keymap.set('n', '<leader>gu', '<cmd>git reset --hard HEAD~1<CR>', { desc= 'Undo last commit', noremap = true, silent = true })

-- 'Git stash' | Stash current changes using no custom stash name
vim.keymap.set('n', '<leader>ga', '<cmd>git stash save<CR>', { desc= 'Git stash (Add)', noremap = true, silent = true })


-- Open lazyGit on the repo of the current buffer
vim.keymap.set('n', '<leader>gg', ':LazyGitCurrentFile<CR>', { desc = 'Open LazyGit', noremap = true, silent = true })



-- _______________________ Git-Signs __________________________
vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_signs<CR>", { desc = "Toggle gitsigns" })

-- These below are located in plugins/gitsigns.lua - they are there so they are buffer-local (loaded on buffer-attach)
-- vim.keymap.set('n', ']H', function() gs.nav_hunk('last') end, { buffer = buffer, desc = 'Last Hunk' })
--
-- -- First Hunk
-- vim.keymap.set('n', '[H', function() gs.nav_hunk('first') end,
--
-- -- Stage Hunk
-- vim.keymap.set({'n', 'v'}, '<leader>ghs', ':Gitsigns stage_hunk<CR>',
--
-- -- Reset Hunk
-- vim.keymap.set({'n', 'v'}, '<leader>ghr', ':Gitsigns reset_hunk<CR>',
--
-- -- Stage Buffer
-- vim.keymap.set('n', '<leader>ghS', gs.stage_buffer,
--
-- -- Undo Stage Hunk
-- vim.keymap.set('n', '<leader>ghu', gs.undo_stage_hunk,
--
-- -- Reset Buffer
-- vim.keymap.set('n', '<leader>ghR', gs.reset_buffer,
--
-- -- Preview Hunk Inline
-- vim.keymap.set('n', '<leader>ghp', gs.preview_hunk_inline,
--
-- -- Blame Line
-- vim.keymap.set('n', '<leader>ghb', function() gs.blame_line({ full = true }) end,
--
-- -- Blame Buffer
-- vim.keymap.set('n', '<leader>ghB', function() gs.blame() end,
--
-- -- Diff This
-- vim.keymap.set('n', '<leader>ghd', gs.diffthis,
--
-- -- Diff This ~
-- vim.keymap.set('n', '<leader>ghD', function() gs.diffthis('~') end,
--
-- -- GitSigns Select Hunk
-- vim.keymap.set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>',




-- _______________________ Vim-fugitive __________________________
-- Open Git status
vim.keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Open Git status" })

-- Commit changes
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })

-- Open Git blame
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git blame" })

-- Diff current file
vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Git diff" })

-- Browse current file on remote (e.g., GitHub)
vim.keymap.set("n", "<leader>go", ":GBrowse<CR>", { desc = "Open file in remote" })

-- Log current file history
vim.keymap.set("n", "<leader>gl", ":Gclog<CR>", { desc = "Git commit log" })

-- Push to remote
--vim.keymap.set("n", "<leader>gP", ":Git push<CR>", { desc = "Git push" })

-- Pull from remote
--vim.keymap.set("n", "<leader>gp", ":Git pull<CR>", { desc = "Git pull" })


-- _______________________ Indent __________________________
-- local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ie', ':lua Snacks.indent.enable()<CR>', { desc = 'Enable Snacks indent' })
vim.keymap.set('n', '<leader>id', ':lua Snacks.indent.disable()<CR>', { desc = 'Disable Snacks indent' })


-- _______________________ LSP __________________________
-- Set up keybindings for LSP functionality in Neovim
-- These mappings use <leader> (default: '\') and other keys for quick access
local opts = { noremap = true, silent = true }

-- Go to definition: Jump to where a symbol (function, variable, etc.) is defined
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

-- Go to declaration: Navigate to the declaration of a symbol (useful in C/C++ or similar)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

-- Find references: List all places a symbol is used in the project
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

-- Hover documentation: Show docs or type info for the symbol under the cursor
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

-- Signature help: Display function signature and parameters while typing
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

-- Rename symbol: Refactor a symbol's name across the project
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

-- Code actions: Apply fixes or refactorings (e.g., fix imports, extract code)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

-- Format code: Auto-format the current buffer per language server rules
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)

-- Next diagnostic: Jump to the next error, warning, or hint in the file
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

-- Previous diagnostic: Jump to the previous error, warning, or hint in the file
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)

-- Open diagnostic float: Show detailed diagnostics for the current line
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)

-- Workspace symbols: Search for symbols (functions, classes, etc.) across the project
vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, opts)

-- Implementation: Go to the implementation of a symbol (e.g., for interfaces or abstract methods)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

-- Type definition: Jump to the type definition of a symbol (e.g., class or type alias)
-- vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)

-- List diagnostics: Show all diagnostics for the project in the quickfix list
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Restart LSP: Restart the language server for the current buffer (useful for troubleshooting)
vim.keymap.set('n', '<leader>lr', ':LspRestart<CR>', opts)

-- Show LSP info: Display details about active language servers for the current buffer
vim.keymap.set('n', '<leader>li', ':LspInfo<CR>', opts)

-- Disable diagnostics for current buffer: Turn off LSP diagnostics for the current file
vim.keymap.set('n', '<leader>dd', function() vim.diagnostic.disable(0) end, opts)

-- Enable diagnostics for current buffer: Re-enable LSP diagnostics for the current file
vim.keymap.set('n', '<leader>de', function() vim.diagnostic.enable(0) end, opts)

-- Disable diagnostics for current line: Suppress diagnostics for the line under the cursor
vim.keymap.set('n', '<leader>dl', function() vim.diagnostic.disable(0, vim.api.nvim_win_get_cursor(0)[1] - 1) end, opts)

-- Enable diagnostics for current line: Re-enable diagnostics for the line under the cursor
vim.keymap.set('n', '<leader>dL', function() vim.diagnostic.enable(0, vim.api.nvim_win_get_cursor(0)[1] - 1) end, opts)




