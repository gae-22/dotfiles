local wezterm = require 'wezterm'
local config = {}
  config.adjust_window_size_when_changing_font_size = false
  config.adjust_window_size_when_changing_font_size = false
  config.color_scheme = 'OneDark (base16)'
  config.enable_scroll_bar = true
  config.font = wezterm.font("HackGenNerd Console", {weight="Regular", stretch="Normal", italic=false})
  -- config.font_antialias = "Greyscale"
  config.font_size = 16.0
  config.hide_mouse_cursor_when_typing = true
  config.hide_tab_bar_if_only_one_tab = true
  config.initial_cols = 80
  config.initial_rows = 24
  config.integrated_title_button_alignment = "Right"
  config.integrated_title_button_color = "Auto"
  config.line_height = 1.2
  config.macos_window_background_blur = 0
  config.mouse_wheel_scrolls_tabs = true
  -- config.native_macos_fullscreen_mode = true
  config.normalize_output_to_unicode_nfc = false
  config.pane_focus_follows_mouse = false
  config.quit_when_all_windows_are_closed = false
  config.scroll_to_bottom_on_input = true
  config.scrollback_lines = 10000
  config.window_background_opacity = 0.8
  config.use_ime = true
return config


