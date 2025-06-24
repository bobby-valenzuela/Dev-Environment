-- ~/.config/nvim/lua/plugins/lsp.lua
-- Configure Mason and Mason-LSPConfig for managing LSP servers
return {


    -- A. Mason for managing LSP servers
  {
    'williamboman/mason.nvim',
    -- dependencies = {
    --     "WhoIsSethDaniel/mason-tool-installer.nvim",
    --     "neovim/nvim-lspconfig", -- Add lspconfig to ensure compatibility
    --  },
    config = function()
        require('mason').setup()
    --     -- INSTALL LINTERs
    --     require("mason-tool-installer").setup({
    --       ensure_installed = {
    --         -- Linters for nvim-lint
    --         "pylint",        -- Python
    --         "ruff",          -- Python
    --         "eslint_d",      -- JavaScript/TypeScript
    --         "vale",          -- Markdown
    --         "cppcheck",      -- C
    --         "perlcritic",    -- Perl
    --         "shellcheck",    -- Bash/Zsh
    --         "luacheck",      -- Lua
    --       },
    --       auto_update = true,
    --       run_on_start = true,
    --     })
    --
    end,
  },


    -- B. Bridge between Mason and nvim-lspconfig
  {
    'mason-org/mason-lspconfig.nvim',
     version = "1.29.0", -- last version that supports Neovim 0.10
    dependencies = {
        'williamboman/mason.nvim',
        'neovim/nvim-lspconfig',                    -- Ensure nvim-lspconfig is a dependency
    },
    config = function()

      -- INSTALL LSPs
      require('mason-lspconfig').setup {
        ensure_installed = {
            "pyright",        -- Python
            "tsserver",       -- JavaScript/TypeScript
            "bashls",         -- Bash
            "clangd",         -- C/C++
            "perlnavigator",  -- Perl
            "lua_ls",         -- Lua
            "html",
            "cssls",
            "rust_analyzer",
            "zls"
        },
      }

    end,
  },

  -- C. nvim-cmp for autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer',   -- Buffer completions
      'hrsh7th/cmp-path',     -- Path completions
      'L3MON4D3/LuaSnip',     -- Snippet engine
      'saadparwaiz1/cmp_luasnip', -- Snippet completions
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm { select = true }, -- Confirm selection
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' }, -- LSP completions
          { name = 'luasnip' },  -- Snippet completions
          { name = 'buffer' },   -- Buffer completions
          { name = 'path' },     -- Path completions
        }),
      }
    end,
  },

   -- D. nvim-lspconfig for configuring LSP servers
-- nvim-lspconfig for configuring LSP servers
  {
    'neovim/nvim-lspconfig',
    dependencies = { 
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp', -- Ensure cmp-nvim-lsp is available
    },
    config = function()
      -- Keep your original configuration
      -- vim.diagnostic.enable(false) -- Uncomment to disable diagnostics on startup

      -- Add nvim-cmp capabilities to LSP
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Define common keybindings for LSP
      local on_attach = function(client, bufnr)
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
      end

      -- Configure LSP servers
      -- local lspconfig = require('nvim-lspconfig')
      -- Module itself is actually called 'lspconfig' (see docs: https://github.com/neovim/nvim-lspconfig)
      local lspconfig = require('lspconfig')

      -- Lua LSP
      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }, -- Recognize 'vim' global
            },
          },
        },
      }

      -- Python LSP (pyright)
      lspconfig.pyright.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      -- TypeScript LSP (ts_ls)
      lspconfig.ts_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      -- Bash LSP (blashls)
      lspconfig.bashls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      -- C LSP (clangd)
      lspconfig.clangd.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      -- Perl LSP (perlnavigator)
      lspconfig.perlnavigator.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
      lspconfig.html.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
      lspconfig.cssls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
      -- Rust LSP (rust_analyzer)
      lspconfig.rust_analyzer.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      -- Zig
      lspconfig.zls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end,
  },



  -- E Linters
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lint = require("lint")

            -- Configure linters by filetype
            lint.linters_by_ft = {
              python = { "pylint", "ruff" },
              javascript = { "eslint_d" },
              typescript = { "eslint_d" },
              -- markdown = { "vale" },
              c = { "cpplint" },
              perl = { "perlcritic" },
              sh = { "shellcheck" },
              zsh = { "shellcheck" },
              lua = { "luacheck" },
            }

            -- :MasonInstall pylint ruff eslint_d vale cpplint  shellcheck luacheck
            -- Autocommand group for linting
            -- local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
            -- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            --   group = lint_augroup,
            --   callback = function()
            --     lint.try_lint()
            --   end,
            -- })

            -- Keymap for manual linting
            vim.keymap.set("n", "<leader>l", function()
              lint.try_lint()
            end, { desc = "Trigger linting for current file" })

      end,
    }




}




-- To install a new LSP

-- 1. [MASON] (Section B) Install a new language server 
	-- a) via Mason manually :Mason
	-- b) via this file => mason-lspconfig.nvim => "ensure_installed"
	-- c) using npm
    -- SERVER NAME => :Mason or :lua print(vim.inspect(require('mason-lspconfig').get_available_servers()))

-- 2: [LSPCONFIG] (Section D) Configure new language server
    -- In this file, add new setup entry to lspconfig.xxx
    -- SERVER NAME => :help lspconfig-all or https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

-- 3: Run Lazy Sync or restart neovim



-- Installing Linters
-- Can be done through this config file, but tricky, easier just to run this
-- :MasonInstall pylint ruff eslint_d vale cpplint  shellcheck luacheck





-- Some Language Servers (manual install without mason)
-- [PYTHON]
-- npm install -g pyright
    -- pyright --version # verify
-- 
-- [PERL]
-- npm install -g @perlnavigator/server
    -- perlnavigator --version # verify
-- 
-- [JAVASCRIPT/TYPESCRIPT]
-- npm install -g typescript typescript-language-server
    -- tsserver --version # verify
-- 
-- [C]
-- sudo apt install clangd 
    -- clangd --version # verify
-- 
-- [BASH]
-- npm install -g bash-language-server
    -- bash-language-server --version # verify




