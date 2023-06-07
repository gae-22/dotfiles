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
    enable_scroll_bar = true,
    font = wezterm.font('PleckJP'),
    font_size = 20.0,
    hide_mouse_cursor_when_typing = true,
    hide_tab_bar_if_only_one_tab = true,
    line_height = 1.2,
    macos_window_background_blur = 0,
    pane_focus_follows_mouse = false,
    quit_when_all_windows_are_closed = true,
    scroll_to_bottom_on_input = true,
    scrollback_lines = 10000,
    skip_close_confirmation_for_processes_named = {''},
    text_background_opacity = 1.0,
    use_fancy_tab_bar = false,
    use_ime = true,
    window_background_opacity = 0.9,
    window_close_confirmation = 'NeverPrompt',
    window_decorations = 'RESIZE',
    window_padding = { left = '1cell', right = '1cell', top = '0.5cell', bottom = '0.5cell', },
    wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
        return {
            {Text=' ' .. tab.active_pane.title .. ' '},
        }
    end),

    -- customized 'Guezwhoz' color scheme following 'https://wezfurlong.org/wezterm/config/appearance.html'
    colors = {
        -- The default text color
        -- foreground = 'silver',
        foreground = '#c0c0c0',
        -- The default background color
        -- background = 'black',
        background = '#2c2c2c',

        -- Overrides the cell background color when the current cell is occupied by the
        -- cursor and the cursor style is set to Block
        -- cursor_bg = '#52ad70',
        cursor_bg = '#eeeeee',
        -- Overrides the text color when the current cell is occupied by the cursor
        -- cursor_fg = 'black',
        cursor_fg = '#eeeeee',
        -- Specifies the border color of the cursor when the cursor style is set to Block,
        -- or the color of the vertical or horizontal bar when the cursor style is set to
        -- Bar or Underline.
        -- cursor_border = '#52ad70',
        cursor_border = '#eeeeee',

        -- the foreground color of selected text
        -- selection_fg = 'black',
        selection_fg = '#eeeeee',
        -- the background color of selected text
        -- selection_bg = '#fffacd',
        selection_bg = '#005f5f',

        -- The color of the scrollbar 'thumb'; the portion that represents the current viewport
        scrollbar_thumb = '#222222',

        -- The color of the split lines between panes
        split = '#333333',


        ansi = {'#080808','#ff5f5f','#87d7af','#d7d787','#5fafd7','#afafff','#77c7c7','#dadada'},
        brights = {'#8a8a8a','#d75f5f','#afd7af','#bebe93','#87afd7','#afafd7','#67b7b7','#dadada'},
        -- Arbitrary colors of the palette in the range from 16 to 255
        indexed = { [136] = '#af8700' },

        -- Since: 20220319-142410-0fcdea07
        -- When the IME, a dead key or a leader key are being processed and are effectively
        -- holding input pending the result of input composition, change the cursor
        -- to this color to give a visual cue about the compose state.
        compose_cursor = 'orange',

        -- Colors for copy_mode and quick_select
        -- available since: 20220807-113146-c2fee766
        -- In copy_mode, the color of the active text is:
        -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
        -- 2. selection_* otherwise
        copy_mode_active_highlight_bg = { Color = '#000000' },

        -- use `AnsiColor` to specify one of the ansi color palette values
        -- (index 0-15) using one of the names 'Black', 'Maroon', 'Green',
        --  'Olive', 'Navy', 'Purple', 'Teal', 'Silver', 'Grey', 'Red', 'Lime',
        -- 'Yellow', 'Blue', 'Fuchsia', 'Aqua' or 'White'.
        copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
        copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
        copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

        quick_select_label_bg = { Color = 'peru' },
        quick_select_label_fg = { Color = '#ffffff' },
        quick_select_match_bg = { AnsiColor = 'Navy' },
        quick_select_match_fg = { Color = '#ffffff' },
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
    },
}

return config
