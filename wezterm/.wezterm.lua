-- This is needed for Wezterm API 
local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font_size = 20 
config.window_decorations = "RESIZE"
config.color_scheme = 'catppuccin-mocha'
-- optional
config.window_background_opacity = 1
config.macos_window_background_blur = 10

-- Keybindings
config.keys = {
  -- Vertical split with CTRL+SHIFT+ALT+' (single quote key)
  {
    key = '"',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },

  -- Horizontal split with CTRL+SHIFT+ALT+'-' (dash key)
  {
    key = '|',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
}

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

return config
