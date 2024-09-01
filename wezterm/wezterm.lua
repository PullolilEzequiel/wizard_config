
local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

local PRIMARY_COLOR = "#000000"
local SECONDARY_COLOR = "#B33951"
local current_opacity = 0.8
config.window_background_opacity = current_opacity
config.enable_wayland = true
config.font = wezterm.font 'Source Code Pro'
config.font_size = 12
config.color_scheme = 'Catppuccin Mocha (Gogh)'
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "TITLE"
config.window_close_confirmation = "NeverPrompt"
config.warn_about_missing_glyphs = false
config.window_frame = {
  active_titlebar_bg=PRIMARY_COLOR,
  inactive_titlebar_bg = PRIMARY_COLOR,
  button_fg = '#8a8a8a',
  button_bg = PRIMARY_COLOR,
  button_hover_fg = '#ffffff',
  button_hover_bg = SECONDARY_COLOR,
}

config.animation_fps = 30
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'
config.webgpu_power_preference = "HighPerformance"


wezterm.on('increment-opacity', function(window, pane)
  current_opacity = current_opacity + 0.2
  if current_opacity >= 1 then
    current_opacity = 1
  end 
  window:set_config_overrides({
    window_background_opacity = current_opacity,
  })
end)
wezterm.on('decrement-opacity', function(window, pane)
  current_opacity = current_opacity - 0.2

  if current_opacity <= 0 then
    current_opacity = 0
  end 
  window:set_config_overrides({
    window_background_opacity = current_opacity,
  })
end)
wezterm.on("increase-pane-size-l", function(window, pane)
  -- Incrementa el tamaño del panel hacia la derecha en un 10%
  window:perform_action(wezterm.action.AdjustPaneSize{"Left", 1}, pane)
end)

wezterm.on("increase-pane-size-r", function(window, pane)
  -- Incrementa el tamaño del panel hacia la derecha en un 10%
  window:perform_action(wezterm.action.AdjustPaneSize{"Right", 1}, pane)
end)

wezterm.on("increase-pane-size-t", function(window, pane)
  -- Incrementa el tamaño del panel hacia la derecha en un 10%
  window:perform_action(wezterm.action.AdjustPaneSize{"Up", 1}, pane)
end)

wezterm.on("increase-pane-size-b", function(window, pane)
  -- Incrementa el tamaño del panel hacia la derecha en un 10%
  window:perform_action(wezterm.action.AdjustPaneSize{"Down", 1}, pane)
end)

wezterm.on("broadcast-input", function(window, pane)
  -- Activa el modo de escritura en todos los paneles
  window:perform_action(wezterm.action.ActivateCopyMode, pane)
end)
config.keys = {
  {
    key = 'Enter',
    mods = 'CTRL',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'Enter',
    mods = 'SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'q',
    mods = 'CTRL',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },  
  -- opacity m
  {
    key = 'UpArrow',
    mods = 'SHIFT',
    action = wezterm.action.EmitEvent 'increment-opacity',
  },
  {
    key = 'DownArrow',
    mods = 'SHIFT',
    action = wezterm.action.EmitEvent 'decrement-opacity',
  },
  {
    key = 'LeftArrow',
    mods = 'CTRL',
    action = wezterm.action.EmitEvent 'increase-pane-size-l',
  },
  {
    key = 'RightArrow',
    mods = 'CTRL',
    action = wezterm.action.EmitEvent 'increase-pane-size-r',
  },
  {
    key = 'UpArrow',
    mods = 'CTRL',
    action = wezterm.action.EmitEvent 'increase-pane-size-t',
  },
  {
    key = 'DownArrow',
    mods = 'CTRL',
    action = wezterm.action.EmitEvent 'increase-pane-size-b',
  },
  {
    key = 'r',
    mods = 'CTRL',
    action = wezterm.action.EmitEvent 'broadcast-input',
  },
}

return config

