-- Pull in the wezterm API

local wezterm = require 'wezterm'



-- This will hold the configuration.


-- In newer versions of wezterm, use the config_builder which will

-- help provide clearer error messages

-- if wezterm.config_builder then

--  config = wezterm.config_builder()

-- end

local config = wezterm.config_builder()



-- This is where you actually apply your config choices



-- For example, changing the color scheme:

--config.color_scheme = 'Batman'
config.color_scheme = 'Calamity'
-- config.color_scheme = 'cyberpunk'
-- config.color_scheme = 'catppuccin-frappe'
-- config.color_scheme = 'cyberpunk'
-- config.color_scheme = 'Rebecca (base16)'
-- config.color_scheme = 'Tokyo Night Storm (Gogh)'
-- config.color_scheme = 'catppuccin-macchiato'
config.color_scheme = 'catppuccin-mocha'
-- config.color_scheme = 'tokyonight-storm'

config.font = wezterm.font 'JetBrains Mono'


config.keys = {

        -- Turn off the default ctrl+v "input the next character literally",
        -- because it works badly with the Windows Clipboard Manager Win+v.
        -- With this update, just select entry from Win+v then Ctrl+Shift+V to paste plain text
        { key = 'v', mods = 'CTRL', action = wezterm.action.Nop },
}

config.wsl_domains = {

  {

    -- The name of this specific domain.  Must be unique amonst all types

    -- of domain in the configuration file.

    name = 'WSL:Ubuntu',



    -- The name of the distribution.  This identifies the WSL distribution.

    -- It must match a valid distribution from your `wsl -l -v` output in

    -- order for the domain to be useful.

    distribution = 'Ubuntu',

     default_cwd = "~"
  },

}

config.default_domain = 'WSL:Ubuntu'


return config
