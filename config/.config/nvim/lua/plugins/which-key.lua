return {
"folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    delay = 500,
    plugins = {
      marks = true,
      registers = true,
      spelling = { enabled = true, suggestions = 20 },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    win = {
      border = "single",
      padding = { 1, 2 },
    },
    triggers = {}, -- Disable automatic popup on leader key
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- Non-leader keybindings
    wk.add({
      { "<C-d>", "22<C-e>", desc = "Scroll down 22 lines", mode = "n" },
      { "<C-u>", "22<C-y>", desc = "Scroll up 22 lines", mode = "n" },
      { "E!", ":bufdo e!<CR>", desc = "Clear all buffers' unsaved changes", mode = "n" },
      { "<C-_>", ":split | resize 15 | set nonumber norelativenumber | terminal<CR> | i", desc = "Open terminal", mode = "n" },
      { "<esc>", ":nohlsearch<CR><esc>", desc = "Clear search highlight", mode = "n" },
      { "<C-b>", "<C-v>", desc = "Enter visual-block mode", mode = "n" },
      { "<F12>", ":cn<CR>", desc = "Next item in quickfix list", mode = "n" },
      { "<F11>", ":cp<CR>", desc = "Previous item in quickfix list", mode = "n" },
      { ">", ">gv", desc = "Indent and keep visual selection", mode = "v" },
      { "<", "<gv", desc = "Unindent and keep visual selection", mode = "v" },
      { "gd", vim.lsp.buf.definition, desc = "Go to definition", mode = "n" },
      { "gD", vim.lsp.buf.declaration, desc = "Go to declaration", mode = "n" },
      { "gr", vim.lsp.buf.references, desc = "Find references", mode = "n" },
      { "K", vim.lsp.buf.hover, desc = "Hover documentation", mode = "n" },
      { "<C-k>", vim.lsp.buf.signature_help, desc = "Signature help", mode = "n" },
      { "]d", vim.diagnostic.goto_next, desc = "Next diagnostic", mode = "n" },
      { "[d", vim.diagnostic.goto_prev, desc = "Previous diagnostic", mode = "n" },
      { "gi", vim.lsp.buf.implementation, desc = "Go to implementation", mode = "n" },
      -- Commented out LSP keybinding
      -- { "gt", vim.lsp.buf.type_definition, desc = "Go to type definition", mode = "n" },
    })

    -- Leader keybindings
    wk.add({
      { "<leader>", group = "Leader" },
      {
        "<leader>F",
        group = "File",
        {
          "<leader>FF",
          function()
            local pattern = vim.fn.input("rargs: ")
            if pattern ~= "" then
              vim.cmd("args **/" .. vim.fn.escape(pattern, " "))
              vim.fn.setqflist({}, "r")
              local args = vim.fn.argv()
              local qflist = {}
              for _, file in ipairs(args) do
                if not file:match("%.swp$") then
                  table.insert(qflist, { filename = vim.fn.expand(file, ":p"), lnum = 1, col = 1 })
                end
              end
              vim.fn.setqflist(qflist, "a")
              vim.cmd("copen")
            end
          end,
          desc = "Recursive args search",
        },
      },
      {
        "<leader>l",
        group = "Line",
        {
          "<leader>ld",
          ":set nonumber norelativenumber<CR>",
          desc = "Disable line numbering",
        },
        {
          "<leader>le",
          ":set number relativenumber<CR>",
          desc = "Enable line numbering",
        },
        {
          "<leader>ll",
          function()
            if vim.opt.number:get() or vim.opt.relativenumber:get() then
              vim.opt.number = false
              vim.opt.relativenumber = false
            else
              vim.opt.number = true
              vim.opt.relativenumber = true
            end
          end,
          desc = "Toggle line numbering",
        },
      },
      { "<leader>h", ":nohlsearch<CR><esc>", desc = "Clear search highlight" },
      {
        "<leader>r",
        group = "Remove/Rename",
        { "<leader>rm", ":delm a-zA-Z0-9<CR>", desc = "Remove all markers" },
        { "<leader>rn", vim.lsp.buf.rename, desc = "Rename symbol" },
      },
      {
        "<leader><down><down>",
        "20<C-e>",
        desc = "Move down 20 steps",
      },
      {
        "<leader><up><up>",
        "20<C-y>",
        desc = "Move up 20 steps",
      },
      {
        "<leader><leader>",
        ":Neotree toggle<CR>",
        desc = "Toggle Neo-tree",
      },
      {
        "<leader>c",
        group = "Change",
        { "<leader>cW", "*Ncgn", desc = "Change word under cursor (repeatable)" },
        { "<leader>cw", "* | :%s::", desc = "Change word under cursor (all)" },
        { "<leader>cy", ":%s:\\V<C-r>\":", desc = "Change yanked text (all)" },
        { "<leader>ca", vim.lsp.buf.code_action, desc = "Code actions" },
      },
      {
        "<leader>a",
        group = "Append",
        { "<leader>aw", "yiw | :%s:\\V<C-r>\":<C-r>\"", desc = "Append word under cursor (all)" },
        { "<leader>ay", ":%s:\\V<C-r>\":<C-r>\"", desc = "Append yanked text (all)" },
        { "<leader>a", function() require("harpoon"):list():add() end, desc = "Harpoon: Add file" },
      },
      {
        "<leader>f",
        group = "Find",
        { "<leader>ff", require("telescope.builtin").find_files, desc = "Telescope: Find files" },
        { "<leader>fg", require("telescope.builtin").live_grep, desc = "Telescope: Live grep" },
        { "<leader>fb", require("telescope.builtin").buffers, desc = "Telescope: Buffers" },
        { "<leader>fh", require("telescope.builtin").help_tags, desc = "Telescope: Help tags" },
        { "<leader>fc", require("telescope.builtin").command_history, desc = "Telescope: Command history" },
        { "<leader>f", vim.lsp.buf.format, desc = "Find" },
      },
      {
        "<leader>m",
        group = "Harpoon",
        { "<leader>m", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Toggle quick menu" },
        { "<leader>M", function() toggle_telescope(require("harpoon"):list()) end, desc = "Open Telescope menu" },
        { "<leader>N", function() require("harpoon"):list():prev() end, desc = "Previous file" },
        { "<leader>n", function() require("harpoon"):list():next() end, desc = "Next file" },
        { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "Go to file 1" },
        { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "Go to file 2" },
        { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "Go to file 3" },
        { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "Go to file 4" },
        { "<leader>5", function() require("harpoon"):list():select(5) end, desc = "Go to file 5" },
        { "<leader>6", function() require("harpoon"):list():select(6) end, desc = "Go to file 6" },
        { "<leader>7", function() require("harpoon"):list():select(7) end, desc = "Go to file 7" },
        { "<leader>8", function() require("harpoon"):list():select(8) end, desc = "Go to file 8" },
        { "<leader>9", function() require("harpoon"):list():select(9) end, desc = "Go to file 9" },
      },
      {
        "<leader>g",
        group = "Git",
        { "<leader>gu", "<cmd>git reset --hard HEAD~1<CR>", desc = "Undo last commit" },
        { "<leader>ga", "<cmd>git stash save<CR>", desc = "Stash changes" },
        { "<leader>gg", ":LazyGitCurrentFile<CR>", desc = "Open LazyGit" },
        { "<leader>gt", ":Gitsigns toggle_signs<CR>", desc = "Toggle Gitsigns" },
        { "<leader>gs", ":Git<CR>", desc = "Git status" },
        { "<leader>gc", ":Git commit<CR>", desc = "Git commit" },
        { "<leader>gb", ":Git blame<CR>", desc = "Git blame" },
        { "<leader>gd", ":Gdiffsplit<CR>", desc = "Git diff" },
        { "<leader>go", ":GBrowse<CR>", desc = "Open file in remote" },
        { "<leader>gl", ":Gclog<CR>", desc = "Git commit log" },
        -- Commented out Git keybindings
        { "<leader>gP", ":Git push<CR>", desc = "Git push" },
        { "<leader>gp", ":Git pull<CR>", desc = "Git pull" },
      },
      {
        "<leader>t",
        group = "Trouble",
        { "<leader>tT", "<cmd>Trouble diagnostics toggle<CR>", desc = "Toggle diagnostics" },
        { "<leader>tt", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Toggle diagnostics (buffer)" },
        { "<leader>tr", "<cmd>Trouble lsp_references toggle<CR>", desc = "Toggle LSP references" },
        { "<leader>td", "<cmd>Trouble lsp_definitions toggle<CR>", desc = "Toggle LSP definitions" },
        { "<leader>tq", "<cmd>Trouble quickfix toggle<CR>", desc = "Toggle quickfix" },
        { "<leader>ts", "<cmd>Trouble symbols toggle focus=false<CR>", desc = "Toggle symbols" },
        { "<leader>tc", "<cmd>Trouble close<CR>", desc = "Close Trouble" },
        { "<leader>tn", ":Trouble diagnostics next<CR>", desc = "Next Trouble item" },
        { "<leader>tp", ":Trouble diagnostics prev<CR>", desc = "Previous Trouble item" },
      },
      {
        "<leader>i",
        group = "Indent",
        { "<leader>ie", ":lua Snacks.indent.enable()<CR>", desc = "Enable indent" },
        { "<leader>id", ":lua Snacks.indent.disable()<CR>", desc = "Disable indent" },
      },
      {
        "<leader>d",
        group = "Diagnostics",
        { "<leader>e", vim.diagnostic.open_float, desc = "Open diagnostic float" },
        { "<leader>dd", function() vim.diagnostic.disable(0) end, desc = "Disable diagnostics (buffer)" },
        { "<leader>de", function() vim.diagnostic.enable(0) end, desc = "Enable diagnostics (buffer)" },
        { "<leader>dl", function() vim.diagnostic.disable(0, vim.api.nvim_win_get_cursor(0)[1] - 1) end, desc = "Disable diagnostics (line)" },
        { "<leader>dL", function() vim.diagnostic.enable(0, vim.api.nvim_win_get_cursor(0)[1] - 1) end, desc = "Enable diagnostics (line)" },
      },
      { "<leader>ws", vim.lsp.buf.workspace_symbol, desc = "Workspace symbols" },
      { "<leader>q", vim.diagnostic.setloclist, desc = "List diagnostics" },
      { "<leader>lr", ":LspRestart<CR>", desc = "Restart LSP" },
      { "<leader>li", ":LspInfo<CR>", desc = "Show LSP info" },
    })

    wk.add({
      { "]h", function() if vim.wo.diff then vim.cmd.normal({ "]c", bang = true }) else require("gitsigns").nav_hunk("next") end end, desc = "Next Hunk", mode = "n" },
      { "[h", function() if vim.wo.diff then vim.cmd.normal({ "[c", bang = true }) else require("gitsigns").nav_hunk("prev") end end, desc = "Prev Hunk", mode = "n" },
      { "]H", function() require("gitsigns").nav_hunk("last") end, desc = "Last Hunk", mode = "n" },
      { "[H", function() require("gitsigns").nav_hunk("first") end, desc = "First Hunk", mode = "n" },
      { "<leader>ghs", ":Gitsigns stage_hunk<CR>", desc = "Stage Hunk", mode = { "n", "v" } },
      { "<leader>ghr", ":Gitsigns reset_hunk<CR>", desc = "Reset Hunk", mode = { "n", "v" } },
      { "<leader>ghu", require("gitsigns").undo_stage_hunk, desc = "Undo Stage Hunk", mode = "n" },
      { "ih", ":<C-U>Gitsigns select_hunk<CR>", desc = "GitSigns Select Hunk", mode = { "o", "x" } },
      { "<leader>ghp", require("gitsigns").preview_hunk_inline, desc = "Preview Hunk Inline", mode = "n" },
      { "<leader>ghS", require("gitsigns").stage_buffer, desc = "Stage Buffer", mode = "n" },
      { "<leader>ghR", require("gitsigns").reset_buffer, desc = "Reset Buffer", mode = "n" },
      { "<leader>ghb", function() require("gitsigns").blame_line({ full = true }) end, desc = "Blame Line", mode = "n" },
      { "<leader>ghB", function() require("gitsigns").blame() end, desc = "Blame Buffer", mode = "n" },
      { "<leader>ghd", require("gitsigns").diffthis, desc = "Diff This", mode = "n" },
      { "<leader>ghD", function() require("gitsigns").diffthis("~") end, desc = "Diff This ~", mode = "n" },
    })
  end,

}
