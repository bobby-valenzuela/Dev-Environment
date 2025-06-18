return {
    "lewis6991/gitsigns.nvim",
    -- event = "LazyFile",
    -- Increase max file length to handle larger files
    max_file_length = 100000, -- Default is 40000; adjust as needed (e.g., 100,000 lines)
    auto_attach = true,
    -- Optimize background loading and updates
    watch_gitdir = {
      follow_files = true, -- Follow file renames/moves
    },
  update_debounce = 100, -- Delay in ms for async updates; tweak for performance (e.g., 200 for slower systems)
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "▎" },
      topdelete = { text = "▎" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    signs_staged = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "▎" },
      topdelete = { text = "▎" },
      changedelete = { text = "▎" },
    },
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

        -- __________ HUNK ACTIONS ____________

        -- Next Hunk
        vim.keymap.set('n', ']h', function()
          if vim.wo.diff then
            vim.cmd.normal({ ']c', bang = true })
          else
            gs.nav_hunk('next')
          end
        end, { buffer = buffer, desc = 'Next Hunk' })

        -- Prev Hunk
        vim.keymap.set('n', '[h', function()
          if vim.wo.diff then
            vim.cmd.normal({ '[c', bang = true })
          else
            gs.nav_hunk('prev')
          end
        end, { buffer = buffer, desc = 'Prev Hunk' })

        -- Last Hunk
        vim.keymap.set('n', ']H', function() gs.nav_hunk('last') end, { buffer = buffer, desc = 'Last Hunk' })

        -- First Hunk
        vim.keymap.set('n', '[H', function() gs.nav_hunk('first') end, { buffer = buffer, desc = 'First Hunk' })

        -- Stage Hunk
        vim.keymap.set({'n', 'v'}, '<leader>ghs', ':Gitsigns stage_hunk<CR>', { buffer = buffer, desc = 'Stage Hunk' })

        -- Reset Hunk
        vim.keymap.set({'n', 'v'}, '<leader>ghr', ':Gitsigns reset_hunk<CR>', { buffer = buffer, desc = 'Reset Hunk' })

        -- Undo Stage Hunk
        vim.keymap.set('n', '<leader>ghu', gs.undo_stage_hunk, { buffer = buffer, desc = 'Undo Stage Hunk' })

        -- GitSigns Select Hunk
        vim.keymap.set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { buffer = buffer, desc = 'GitSigns Select Hunk' })

        -- Preview Hunk Inline
        vim.keymap.set('n', '<leader>ghp', gs.preview_hunk_inline, { buffer = buffer, desc = 'Preview Hunk Inline' })



        -- __________ -- BUFFER ACTIONS AND MORE ___________

        -- Stage Buffer
        vim.keymap.set('n', '<leader>ghS', gs.stage_buffer, { buffer = buffer, desc = 'Stage Buffer' })

        -- Reset Buffer
        vim.keymap.set('n', '<leader>ghR', gs.reset_buffer, { buffer = buffer, desc = 'Reset Buffer' })

        -- Blame Line
        vim.keymap.set('n', '<leader>ghb', function() gs.blame_line({ full = true }) end, { buffer = buffer, desc = 'Blame Line' })

        -- Blame Buffer
        vim.keymap.set('n', '<leader>ghB', function() gs.blame() end, { buffer = buffer, desc = 'Blame Buffer' })

        -- Diff This
        vim.keymap.set('n', '<leader>ghd', gs.diffthis, { buffer = buffer, desc = 'Diff This' })

        -- Diff This ~
        vim.keymap.set('n', '<leader>ghD', function() gs.diffthis('~') end, { buffer = buffer, desc = 'Diff This ~' })
    end,
  },
}


-- Alternative - not as good as gitsigns, but sometimes works on very large files when gitsigns (50,000 lines+)
-- Configuration for vim-gitgutter with lazy.nvim

-- return {
--   "airblade/vim-gitgutter",
--   -- Load the plugin immediately (adjust event if you want lazy loading)
--   event = "BufReadPost",
--   config = function()
--     -- Enable vim-gitgutter by default
--     vim.g.gitgutter_enabled = 1
--     -- Update signs in real-time
--     vim.g.gitgutter_realtime = 1
--     -- Set updatetime to 100ms for faster updates
--     vim.opt.updatetime = 100
--     -- Set max signs to 100,000
--     vim.g.gitgutter_max_signs = 100000
--     -- Define gitgutter icons
--     vim.g.gitgutter_sign_added = "XX"
--     vim.g.gitgutter_sign_modified = "~"
--     vim.g.gitgutter_sign_removed = "-"
--     vim.g.gitgutter_sign_removed_first_line = "^"
--     vim.g.gitgutter_sign_removed_above_and_below = "_"
--     vim.g.gitgutter_sign_modified_removed = "~-"
--
--     -- Keybindings
--     local map = vim.keymap.set
--     -- Toggle git signs
--     map("n", "<Leader>gt", ":GitGutterToggle<CR>", { desc = "Toggle GitGutter signs", silent = true })
--     -- Open fugitive's :Git (assuming vim-fugitive is installed)
--     map("n", "<Leader>gs", ":Git<CR>", { desc = "Open :Git", silent = true })
--   end,
-- }
