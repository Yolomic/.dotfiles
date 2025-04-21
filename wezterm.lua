-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Load wezterm-status plugin with custom configuration
local status_ok, status = pcall(function()
return wezterm.plugin
.require('https://github.com/yriveiro/wezterm-status')
.apply_to_config(config, {
  cells = {
    hostname = { enabled = false },  -- Disable hostname
    date = { format = '%H:%M:%S' },  -- Format to show only time
    cwd = { enabled = true },        -- Ensure current directory is enabled
    battery = { enabled = false },   -- Disable battery cell (if enabled by default)
user = { enabled = false },      -- Disable user cell (if enabled by default)
  }
})
end)

if not status_ok then
  wezterm.log_error('Failed to load wezterm-status plugin')
  else
    wezterm.log_info('wezterm-status plugin loaded successfully')
    end

    -- For example, changing the color scheme:
    config.color_scheme = "Catppuccin Mocha" -- or Macchiato, Frappe, Latte
    config.window_background_opacity = 0.9
    config.window_background_image = '/home/yolomic/Pictures/felix.gif'
    config.window_background_image_hsb = {
      brightness = 0.1,
      hue = 1.0,
      saturation = 1.0,
    }

    -- Set up some basic config options
    config.enable_tab_bar = true
    config.hide_tab_bar_if_only_one_tab = false  -- Always show the tab bar, even with one tab
    config.use_fancy_tab_bar = true
    config.font = wezterm.font('JetBrainsMono Nerd Font')
    config.font_size = 12.0

    -- Ensure there's no invalid or missing value causing the '?' symbol
    wezterm.on('update-right-status', function(window, pane)
    local cwd = pane:get_current_working_dir()
    local cwd_display = cwd and cwd.file_path or '~' -- Use ~ if cwd is nil

    -- Update the right status with only cwd and time
    window:set_right_status(
      status.format({
        { Text = ' | ' .. cwd_display .. ' ' },
        { Text = ' | ' .. wezterm.strftime('%H:%M:%S') .. ' ' },
      })
    )
    end)

    -- Return the configuration
    return config
