-- Neovim Keymaps Cheat Sheet
-- Core Neovim
--
-- <C-d>: Scroll down 22 lines
-- <C-u>: Scroll up 22 lines
-- E!: Clear all buffers' unsaved changes
-- <Leader>ll: Toggle line numbering
-- <C-_>: Open terminal in split window
-- <esc>: Clear search highlights
-- <leader>h: Clear search highlights
-- <C-b>: Enter visual-block mode
-- <leader>rm: Remove all markers
-- <leader><down><down>: Move down 20 lines
-- <leader><up><up>: Move up 20 lines
-- <F12>: Next item in quickfix list
-- <F11>: Previous item in quickfix list
-- >: Indent and keep visual selection
-- <: Unindent and keep visual selection
-- <leader>FF: Recursive args with pattern, populate quickfix
--
-- Neotree
--
-- <leader><leader>: Toggle Neo-tree file explorer
--
-- Telescope
--
-- <leader>ff: Telescope find files
-- <leader>fg: Telescope live grep
-- <leader>fb: Telescope buffers
-- <leader>fh: Telescope help tags
-- <leader>fc: Telescope command history
--
-- Harpoon
--
-- <leader>a: Harpoon: Add file
-- <leader>m: Harpoon: Toggle quick menu
-- <leader>N: Harpoon: Previous file
-- <leader>n: Harpoon: Next file
-- <leader>1: Harpoon: Go to file 1
-- <leader>2: Harpoon: Go to file 2
-- <leader>3: Harpoon: Go to file 3
-- <leader>4: Harpoon: Go to file 4
-- <leader>5: Harpoon: Go to file 5
-- <leader>6: Harpoon: Go to file 6
--
-- Git (General)
--
-- <leader>gu: Undo last Git commit
-- <leader>ga: Stash current Git changes
-- <leader>gg: Open LazyGit for current file
--
-- Gitsigns
--
-- <leader>gt: Toggle Git signs
-- ]H: Go to last hunk
-- [H: Go to first hunk
-- <leader>ghs: Stage hunk
-- <leader>ghr: Reset hunk
-- <leader>ghS: Stage buffer
-- <leader>ghu: Undo stage hunk
-- <leader>ghR: Reset buffer
-- <leader>ghp: Preview hunk inline
-- <leader>ghb: Blame line
-- <leader>ghB: Blame buffer
-- <leader>ghd: Diff this
-- <leader>ghD: Diff this against ~
-- ih: Select hunk (operator and visual mode)
--
-- Vim-fugitive
--
-- <leader>gs: Open Git status
-- <leader>gc: Git commit
-- <leader>gb: Git blame
-- <leader>gd: Git diff
-- <leader>go: Open file in remote
-- <leader>gl: Git commit log
--
-- Snacks (Indent)
--
-- <leader>ie: Enable Snacks indent
-- <leader>id: Disable Snacks indent
--
-- LSP
--
-- gd: Go to definition
-- gD: Go to declaration
-- gr: Find references
-- K: Hover documentation
-- <C-k>: Signature help
-- <leader>rn: Rename symbol
-- <leader>ca: Code actions
-- <leader>f: Format code
-- ]d: Next diagnostic
-- [d: Previous diagnostic
-- <leader>e: Open diagnostic float
-- <leader>ws: Workspace symbols
-- gi: Go to implementation
-- <leader>q: List diagnostics in quickfix
-- <leader>lr: Restart LSP
-- <leader>li: Show LSP info
-- <leader>dd: Disable diagnostics for buffer
-- <leader>de: Enable diagnostics for buffer
-- <leader>dl: Disable diagnostics for current line
-- <leader>dL: Enable diagnostics for current line
--





-- :args - but assumes recursive
vim.keymap.set('n', '<leader>FF', function()
    -- Prompt for a file pattern
    local pattern = vim.fn.input('rargs: ')
    if pattern ~= '' then
        -- Prepend **/ and execute :args
        vim.cmd('args **/' .. vim.fn.escape(pattern, ' '))
        vim.fn.setqflist({}, 'r')  -- Clear quickfix list
        local args = vim.fn.argv() -- Get argument list
        local qflist = {}
        for _, file in ipairs(args) do
            if not file:match('%.swp$') then -- Skip .swp files
                table.insert(qflist, { filename = vim.fn.expand(file, ':p'), lnum = 1, col = 1 })
            end
        end
        vim.fn.setqflist(qflist, 'a') -- Add entries to quickfix list
        vim.cmd('copen')              -- Open quickfix window
    end
end, { noremap = true, silent = true })


-- Smaller movements up/down buffer
vim.keymap.set('n', '<C-d>', '22<C-e>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-u>', '22<C-y>', { noremap = true, silent = true })

-- Clear all buffers' unsaved changes
vim.keymap.set('n', 'E!', ':bufdo e!<CR>', { noremap = true, silent = true })

-- Toggle line numbering
vim.keymap.set('n', '<Leader>ll', 'set nonumber norelativenumber', { noremap = true, silent = true })

-- Integrated Terminal
vim.keymap.set('n', '<C-_>', ':split | resize 15 | set nonumber norelativenumber | terminal<CR> | i',
    { noremap = true, silent = true })

-- Escape key impled :nohl (as well as leader+h to unhighlight)
vim.keymap.set('n', '<esc>', ':nohlsearch<CR><esc>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR><esc>', { noremap = true, silent = true })

-- Map Ctrl+b to enter visual-block mode
vim.keymap.set('n', '<C-b>', '<C-v>', { noremap = true, silent = true })

-- 'Remove Markers' | Remove all markers
vim.keymap.set('n', '<leader>rm', ':delm a-zA-Z0-9<CR>', { desc = 'Remove All Markers', noremap = true, silent = true })

-- move up/down in 20-step jumps
vim.keymap.set('n', '<leader><down><down>', '20<C-e>', { desc = 'Move down 20 steps', noremap = true, silent = true })
vim.keymap.set('n', '<leader><up><up>', '20<C-y>', { desc = 'Move down 20 steps', noremap = true, silent = true })

-- Quickfix nav shortcuts
vim.keymap.set('n', '<F12>', ':cn<CR>', { desc = 'Next item in quickfix list', noremap = true, silent = true })
vim.keymap.set('n', '<F11>', ':cp<CR>', { desc = 'Previous item in quickfix list', noremap = true, silent = true })

-- Neotree
vim.keymap.set('n', '<leader><leader>', ':Neotree toggle<CR>',
    { desc = 'Toggle Neo-tree file explorer', noremap = true, silent = true })

-- Remap > to indent and keep visual selection
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

-- Remap < to unindent and keep visual selection
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })



-- Find and [c]hange [w]ord under cursor - <Esc> to apply and . to repeat
vim.keymap.set('n', '<leader>cW', '*Ncgn', { noremap = true, silent = true })

-- Find and [c]hange [W]ord under cursor - replace all in doc
vim.keymap.set('n', '<leader>cw', '* | :%s::', { noremap = true, silent = true })

-- Find and [a]ppend [w] word under cursor - replace all in the doc
vim.keymap.set('n', '<leader>aw', 'yiw | :%s:\\V<C-r>":<C-r>"', { noremap = true, silent = true })

-- Find and [c]hange [Y]anked text - replace all in doc
vim.keymap.set('n', '<leader>cy', ':%s:\\V<C-r>":', { noremap = true, silent = true })

-- Find and [a]ppend [y]anked text- replace all in doc
vim.keymap.set('n', '<leader>ay', ':%s:\\V<C-r>":<C-r>"', { noremap = true, silent = true })


-- _______________________ Telescope __________________________
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Fuzzy File search - Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Fuzzy grep - Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Fuzzy buffer search - Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Fuzzy tags - Telescope help tags' })
vim.keymap.set('n', '<leader>fc', require('telescope.builtin').command_history, { desc = 'Fuzzy command find - Search command history' })

-- _______________________ Harpoon __________________________
local harpoon = require("harpoon")

-- ==> (optional) basic telescope UI configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end
-- ==> end optional telescope menu

vim.keymap.set("n", "<leader>m", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: Toggle quick menu" })
vim.keymap.set("n", "<leader>M", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon: Add file" })
vim.keymap.set("n", "<leader>N", function() harpoon:list():prev() end, { desc = "Harpoon: Previous file" })
vim.keymap.set("n", "<leader>n", function() harpoon:list():next() end, { desc = "Harpoon: Next file" })
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon: Go to file 1" })
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon: Go to file 2" })
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon: Go to file 3" })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon: Go to file 4" })
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "Harpoon: Go to file 5" })
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end, { desc = "Harpoon: Go to file 6" })
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end, { desc = "Harpoon: Go to file 7" })
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end, { desc = "Harpoon: Go to file 8" })
vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end, { desc = "Harpoon: Go to file 9" })


-- _______________________ Git (General) __________________________
-- 'Git Undo' | Undo last commit and set changes as staged and unsaved
vim.keymap.set('n', '<leader>gu', '<cmd>git reset --hard HEAD~1<CR>',
    { desc = 'Undo last commit', noremap = true, silent = true })

-- 'Git stash' | Stash current changes using no custom stash name
vim.keymap.set('n', '<leader>ga', '<cmd>git stash save<CR>', { desc = 'Git stash (Add)', noremap = true, silent = true })


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
