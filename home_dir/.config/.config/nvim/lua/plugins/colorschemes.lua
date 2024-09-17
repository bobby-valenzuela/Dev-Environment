return {

  -- onedark`` 
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
      require('onedark').setup {
        style = 'deep'
      }
      require('onedark').load()
    end
  },
  {
    "LazyVim/LazyVim",
    opts = {
      theme = "onedark"
    }
  }

}

-- Other Colorschemes I like
--return {
--
--  {
--    "eldritch-theme/eldritch.nvim",
--    priority = 1000, -- Ensure it loads first
--  },
--  {
--    "LazyVim/LazyVim",
--    opts = {
--      colorscheme = "eldritch"
--    }
--  },
--
--  -- bluloco
--  {
--    "uloco/bluloco.nvim",
--    dependencies = { 'rktjmp/lush.nvim' },
--    priority = 1000, -- Ensure it loads first
--  },
--  {
--    "LazyVim/LazyVim",
--    opts = {
--      colorscheme = "bluloco-dark"
--    }
--  },
--
--  -- darkflat
--  {
--    "sekke276/dark_flat.nvim",
--    priority = 1000, -- Ensure it loads first
--  },
--  {
--    "LazyVim/LazyVim",
--    opts = {
--      colorscheme = "dark_flat"
--    }
--  },
--
--}
