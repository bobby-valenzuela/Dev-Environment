local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load all plugin configurations from the plugins/ directory
-- require('lazy').setup('plugins')

-- Load your plugins
require("lazy").setup({
  -- Example plugin
    {
        'maxmx03/fluoromachine.nvim',
        lazy = false,
        priority = 1000,
        config = function ()
         local fm = require 'fluoromachine'

         fm.setup {
            glow = true,
            brightness = 0.0275,
            theme = 'fluoromachine',
            -- theme = 'retrowave',
            transparent = false,
            overrides = {
                -- ['@type'] = { italic = true, bold = false },
                ['@function'] = { italic = true, bold = false },
                ['@comment'] = { italic = true },
                -- ['@keyword'] = { italic = false },
                -- ['@constant'] = { italic = false, bold = false },
                -- ['@variable'] = { italic = true },
                -- ['@field'] = { italic = true },
                -- ['@parameter'] = { italic = true },
            },
            colors = function(_, color)
                local darken = color.darken
                local lighten = color.lighten
                local blend = color.blend
                local shade = color.shade
                local tint = color.tint
                return {
                -- bg = '#200933', -- default
                bg = darken('#200933', 25),
                bgdark = darken('#200933', 35),
                -- cyan = '#49eaff',
                -- red = '#ff1e34',
                -- yellow = '#ffe756',
                -- orange = '#f38e21',
                -- pink = '#ffadff',
                -- purple = '#9544f7',
            }
            end,
         }

         vim.cmd.colorscheme 'fluoromachine'
        end
    }
})
