local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

local config = {}

wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

local config = {
    adjust_window_size_when_changing_font_size = false,
    colors = { cursor_bg = '#fffaf5', cursor_fg = 'black', cursor_border = '#fffaf5', },
    -- color_scheme = 'Vs Code Dark+ (Gogh)',
    color_scheme = 'iceberg-dark',
    enable_scroll_bar = true,
    font = wezterm.font('PleckJP'),
    font_size = 18.5,
    hide_mouse_cursor_when_typing = true,
    hide_tab_bar_if_only_one_tab = true,
    line_height = 1.2,
    macos_window_background_blur = 0,
    pane_focus_follows_mouse = false,
    scrollback_lines = 10000,
    skip_close_confirmation_for_processes_named = {''},
    text_background_opacity = 0.95,
    use_fancy_tab_bar = false,
    window_background_opacity = 0.85,
    window_close_confirmation = 'NeverPrompt',
    window_decorations = 'RESIZE',
    window_padding = { left = '1cell', right = '1cell', top = '0.5cell', bottom = '0.5cell', },
    wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
        return {
            {Text=' ' .. tab.active_pane.title .. ' '},
        }
    end),
    colors = {
        cursor_bg = '#fffaf5',
        cursor_fg = 'black',
        cursor_border = '#fffaf5',
        tab_bar = {
            background = '#1b1f2f',
            active_tab = {
                bg_color = '#444b71',
                fg_color = '#c6c8d1',
                intensity = 'Normal',
                underline = 'None',
                italic = false,
                strikethrough = false,
            },
            inactive_tab = {
                bg_color = '#282d3e',
                fg_color = '#c6c8d1',
                intensity = 'Normal',
                underline = 'None',
                italic = false,
                strikethrough = false,
            },
            inactive_tab_hover = {
                bg_color = '#1b1f2f',
                fg_color = '#c6c8d1',
                intensity = 'Normal',
                underline = 'None',
                italic = true,
            strikethrough = false,
            },
            new_tab = {
                bg_color = '#1b1f2f',
                fg_color = '#c6c8d1',
                italic = false
            },
            new_tab_hover = {
                bg_color = '#444b71',
                fg_color = '#c6c8d1',
                italic = false
            },
        },
    },
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
        { key = 'w', mods = 'CMD',       action = act.CloseCurrentPane { confirm = false }, },
        -- close the current tab
        { key = 'w', mods = 'CMD|SHIFT', action = act{ CloseCurrentTab = { confirm = false }, }, },
        -- move to the next tab
        { key = ']', mods = 'CMD|SHIFT', action = act{ ActivateTabRelative=1}, },
        -- move to the previous tab
        { key = '[', mods = 'CMD|SHIFT', action = act{ ActivateTabRelative=-1}, },

        -- vim ~/.wezterm.lua
    },
}

return config

