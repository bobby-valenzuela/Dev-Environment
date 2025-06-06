-- ~/.config/nvim/lua/plugins/mason.lua
-- Configure Mason and Mason-LSPConfig for managing LSP servers
return {


    -- 1. Mason for managing LSP servers
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },


    -- 2. Bridge between Mason and nvim-lspconfig
  {
    'mason-org/mason-lspconfig.nvim',
     version = "1.29.0", -- last version that supports Neovim 0.10
    dependencies = {
        'williamboman/mason.nvim',
      'neovim/nvim-lspconfig', -- Ensure nvim-lspconfig is a dependency
    },
    config = function()
      require('mason-lspconfig').setup {
        -- List of LSP servers to install
        ensure_installed = {
            "pyright",        -- Python
            "tsserver",       -- JavaScript/TypeScript
            "bashls",         -- Bash
            "clangd",         -- C/C++
            "perlnavigator",  -- Perl
            "lua_ls",         -- Lua
            "html",
            "cssls",
        },
      }
    end,
  },

  -- 3. nvim-cmp for autocompletion
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

   -- 4. nvim-lspconfig for configuring LSP servers
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
    end,
  },

}

-- return {
--   "williamboman/mason.nvim",
--   build = ":MasonUpdate",
--   config = true,
--   dependencies = {
--     "williamboman/mason-lspconfig.nvim",
--     version = "1.29.0", -- last version that supports Neovim 0.10
--   },
-- }
