local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

local config = {
    adjust_window_size_when_changing_font_size = false,
    colors = { cursor_bg = '#fffaf5', cursor_fg = 'black', cursor_border = '#fffaf5', },
    color_scheme = 'OneDark (base16)',
    enable_scroll_bar = true,
    -- font = wezterm.font("HackGenNerd Console", {weight="Regular", stretch="Normal", italic=false}),
    font = wezterm.font("PleckJP"),
    font_size = 20.0,
    hide_mouse_cursor_when_typing = true,
    hide_tab_bar_if_only_one_tab = true,
    line_height = 1.2,
    macos_window_background_blur = 0,
    pane_focus_follows_mouse = false,
    scrollback_lines = 10000,
    window_background_opacity = 0.8,
    window_decorations = "RESIZE",
    window_padding = { left = '1cell', right = '1cell', top = '0.5cell', bottom = '0.5cell', },
    keys = {
        -- increase font size
        { key = '+', mods = 'CMD',       action = act.IncreaseFontSize },
        -- decrease font size
        { key = '-', mods = 'CMD',       action = act.DecreaseFontSize },
        -- reset font size
        { key = '0', mods = 'CMD',       action = act.ResetFontSize    },
        -- select the next pane
        { key = ']', mods = 'CMD',       action = act.ActivatePaneDirection 'Prev' },
        -- select the previous pane
        { key = '[', mods = 'CMD',       action = act.ActivatePaneDirection 'Next' },
        -- reset pane
        { key = 'r', mods = 'CMD',       action = act.ResetTerminal},
        -- split the current pane vertically
        { key = 'd', mods = 'CMD',       action = act.SplitPane{ direction = 'Right', size = { Percent = 50 }, }, },
        -- split the current pane horizontally
        { key = 'd', mods = 'CMD|SHIFT', action = act.SplitPane{ direction = 'Down', size = { Percent = 50 }, }, },
        -- close the current pane
        { key = 'w', mods = 'CMD',       action = act.CloseCurrentPane { confirm = true }, },
        -- close the current tab
        { key = 'w', mods = 'CMD|SHIFT', action = act{CloseCurrentTab={confirm=true}}, },
        -- move to the next tab
        { key = ']', mods = 'CMD|SHIFT', action = act{ActivateTabRelative=1}, },
        -- move to the previous tab
        { key = '[', mods = 'CMD|SHIFT', action = act{ActivateTabRelative=-1}, },
    }
}

return config

