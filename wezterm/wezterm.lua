local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

local config = {
    adjust_window_size_when_changing_font_size = false,
    color_scheme = 'OneDark (base16)',
    disable_default_key_bindings = true,
    enable_scroll_bar = true,
    -- font = wezterm.font("HackGenNerd Console", {weight="Regular", stretch="Normal", italic=false}),
    font = wezterm.font("PleckJP"),
    font_size = 20.0,
    hide_mouse_cursor_when_typing = true,
    hide_tab_bar_if_only_one_tab = true,
    initial_cols = 80,
    initial_rows = 24,
    integrated_title_button_alignment = "Right",
    integrated_title_button_color = "Auto",
    line_height = 1.2,
    macos_window_background_blur = 0,
    mouse_wheel_scrolls_tabs = true,
    -- native_macos_fullscreen_mode = true,
    normalize_output_to_unicode_nfc = false,
    pane_focus_follows_mouse = false,
    quit_when_all_windows_are_closed = false,
    scroll_to_bottom_on_input = true,
    scrollback_lines = 10000,
    window_background_opacity = 0.8,
    window_decorations = "RESIZE",
    use_ime = true,
    keys = {
        -- select the next pane
        { key = '[', mods = 'CMD', action = wezterm.action.ActivatePaneDirection 'Next' },
        -- select the previous pane
        { key = ']', mods = 'CMD', action = wezterm.action.ActivatePaneDirection 'Prev' },
        -- make a pane by splitting the current pane vertically
        { key = '¥', mods = 'CMD', action = wezterm.action.SplitPane { direction = 'Right', size = { Percent = 50 }, }, },
        -- make a pane by splitting the current pane horizontally
        { key = '-', mods = 'CMD', action =wezterm.action.SplitPane { direction = 'Down', size = { Percent = 50 }, }, },
        -- close the current pane
        { key = 'w', mods = 'CMD', action = wezterm.action.CloseCurrentPane { confirm = true }, },
        -- create a new tab
        { key = 't', mods = 'CMD', action = wezterm.action{SpawnTab="CurrentPaneDomain"}, },
        -- close the current tab
        { key = 'w', mods = 'CMD|SHIFT', action = wezterm.action{CloseCurrentTab={confirm=true}}, },
        -- move to the next tab
        { key = ']', mods = 'CMD|SHIFT', action = wezterm.action{ActivateTabRelative=1}, },
        -- move to the previous tab
        { key = '[', mods = 'CMD|SHIFT', action = wezterm.action{ActivateTabRelative=-1}, },
        { key = "r", mods = "CTRL", action = wezterm.action{ EmitEvent = "open-nvtop-and-ytop", }, },
    }
}

return config

