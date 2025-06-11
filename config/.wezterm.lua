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

config.color_scheme = 'Tokyo Night Storm (Gogh)'
config.color_scheme = 'catppuccin-macchiato'
config.color_scheme = 'catppuccin-frappe'
config.color_scheme = 'cyberpunk'
config.color_scheme = 'Calamity'

config.color_scheme = 'catppuccin-mocha'

config.color_scheme = 'tokyonight-storm'
config.color_scheme = 'Rebecca (base16)'
config.color_scheme = 'cyberpunk'
config.color_scheme = 'Rebecca (base16)'

-- Get the base color scheme
local scheme = wezterm.color.get_builtin_schemes()['cyberpunk']
-- Override the background color
scheme.background = '#000000' -- Set to pure black, for example

-- Define the modified scheme
config.color_schemes = {
  ['Custom Mocha'] = scheme,
}

-- Apply the modified scheme
config.color_scheme = 'Custom Mocha'

config.font = wezterm.font 'JetBrains Mono'
config.font_rules = {
  {
    italic = true,
    font = wezterm.font("JetBrainsMono Nerd Font", { italic = true }),
  },
  {
    italic = false,
    intensity = "Bold",
    font = wezterm.font("JetBrainsMono Nerd Font", { bold = true }),
  }
}
canonicalize_pasted_newlines = 'LineFeed'
term = 'xterm-256color'
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
config.window_background_opacity = 0.7
-- config.win32_system_backdrop = 'Mica'
-- config.win32_system_backdrop = 'Acrylic'

-- config.window_decorations = "RESIZE"

-- config.window_background_gradient = {
  -- colors = { '#EEBD89', '#D13ABD' },
  -- colors = { '#0b60e7', '#235bff', '#2420b3', '#110bf0' },
  -- colors = { '#000000', '#24248a', '#3c3c3c' },


  -- preset = "Sinebow",


  -- segment_size = 35,
  -- segment_smoothness = 0.5,

  -- Specifies a Linear gradient starting in the top left corner.
  -- orientation = { Linear = { angle = -270.0 } },
-- }



-- The following options affect the fancy tab bar:
config.window_frame = {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  -- font = wezterm.font { family = 'Roboto', weight = 'Bold' },
  font = wezterm.font("JetBrainsMono Nerd Font", { italic = true }),


  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 12.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#333333',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#333333',
}

config.colors = {
  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    inactive_tab_edge = '#575757',
  },
}

config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.8,
}

config.window_background_image = 'Downloads\\black_wave.gif'
-- config.window_background_image = 'C:\\Users\\BobbyValenzuela\\OneDrive - Probax\\Pictures\\black_wave.gif'

config.window_background_image_hsb = {
  -- Darken the background image by reducing it to 1/3rd
  brightness = 0.03,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  hue = 1.0,

  -- You can adjust the saturation also.
  saturation = 1.0,
}

return config
