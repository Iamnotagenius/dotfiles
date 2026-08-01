--  Please note not all available settings / options are set here.
--  For a full list, see the wiki
--  https://wiki.hyprland.org
--  See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor {
    output = "HDMI-A-1",
    mode = "1920x1080@100",
    position = "0x0",
    scale = "1"
}
hl.monitor {
    output = "DP-2",
    mode = "1440x900@75",
    position = "1920x208",
    scale = "1"
}

-- Workspace rules

local ws_by_monitor = {
    ["HDMI-A-1"] = {"1", "7"},
    ["DP-2"]     = {"2", "4"},
}

local autostart = {
    ["1"] = "alacritty",
    ["5"] = "syncplay",
    ["6"] = "virt-manager",
    ["7"] = "steam",
    ["8"] = "$BROWSER",
}

local function exec_autostart()
    local ws = hl.get_active_workspace()
    hl.dsp.exec_cmd("uwsm app -- " .. autostart[ws])
end

for mon, workspaces in pairs(ws_by_monitor) do
    for _, ws in ipairs(workspaces) do
        hl.workspace_rule { monitor = mon, workspace = ws }
    end
end

for ws, cmd in pairs(autostart) do
    hl.workspace_rule { workspace = ws, on_created_empty = "uwsm app -- " .. cmd }
end

-- See https://wiki.hypr.land/Configuring/Basics/Variables/ for more
hl.config {
    debug = {
        disable_logs = false
    },
    input = {
        kb_options = "grp:lctrl_lwin_toggle,altwin:menu_win",
        kb_layout = "us,ru",
        kb_model = "pc104",
        follow_mouse = 1,
        numlock_by_default = true,
        sensitivity = 0
    },
    cursor = {
        inactive_timeout = 3,
        no_warps = false,
    },
    general = {
        allow_tearing = true,
        gaps_in = 5,
        gaps_out = 5,
        border_size = 2,
        col = {
            active_border = "rgba(98c379ee)",
            inactive_border = "rgba(e06c7500)",
        },
        layout = "master"
    },
    decoration = {
        rounding = 8,
        inactive_opacity = 0.900000,
        blur = {
            ignore_opacity = true,
            size = 3,
            passes = 1,
        }
    },
    animations = {
        enabled = true,
    },
    misc = {
        enable_swallow = true,
        swallow_regex = "Alacritty",
        swallow_exception_regex = "(wev|preview)",
        vrr = 2
    },
    dwindle = {
        preserve_split = true
    },
    master = {
        new_on_top = true
    },
}

hl.curve("openBezier", {
    type = "bezier",
    points = { {0.000000, 1.000000}, {0.500000, 1.000000} },
})
hl.curve("closeBezier", {
    type = "bezier",
    points = { {1.000000, 0.000000}, {1.000000, 0.500000} },
})
hl.curve("slideWs", {
    type = "bezier",
    points = { {0.590000, 0.400000}, {0.350000, 1} },
})

hl.animation { enabled = true, leaf = "windowsIn", speed = 4, bezier = "openBezier" }
hl.animation { enabled = true, leaf = "windowsOut", speed = 3, bezier = "closeBezier" }
hl.animation { enabled = true, leaf = "fadeIn", speed = 4, bezier = "openBezier" }
hl.animation { enabled = true, leaf = "fadeOut", speed = 2, bezier = "closeBezier" }
hl.animation { enabled = true, leaf = "windowsMove", speed = 4, bezier = "slideWs" }
hl.animation { enabled = true, leaf = "border", speed = 10, bezier = "default" }
hl.animation { enabled = true, leaf = "fade", speed = 7, bezier = "default" }
hl.animation { enabled = true, leaf = "workspaces", speed = 5, bezier = "slideWs", style = "slide" }

local ws_by_class = {
    [".*zathura.*"] = "2",
    ["(Kotatogram_Desktop|discord|dragon-drop|Electron|webcord|org.telegram.desktop|Element)"] = "4",
    ["org.remmina.Remmina"] = "6",
    [".*steam.*"] = "7",
    ["gamescope"] = "7",
    ["(qutebrowser|brave-browser|Tor Browser|vivaldi-stable|floorp)"] = "8",
}

for class, ws in pairs(ws_by_class) do
    hl.window_rule {
        match = {
            class = class
        },
        workspace = ws,
    }
end

hl.window_rule {
    match = {
        title = "Steam Big Picture"
    },
    workspace = "7",
}
hl.window_rule {
    match = {
        class = ".*steam.*",
        float = true,
    },
    pin = true,
}
hl.window_rule {
    match = {
        class = ".*steam.*",
        title = "^$"
    },
    tag = "menu"
}

local toggleable_matches = {
    { class = "^(Alacritty-toggleable|org.pulseaudio.pavucontrol)$" },
    { title = "ncmpcpp" },
    { title = "btop" },
    { title = "calcurse" },
    { title = "calc" },
}

for _, match in ipairs(toggleable_matches) do
    hl.window_rule {
        match = match,
        tag = "+toggleable",
    }
end

hl.window_rule {
    match = {
        tag = "toggleable",
    },
    float = true,
    pin = true,
    animation = "slide",
    move = "monitor_w-window_w-10 37",
}

hl.window_rule {
    match = {
        class = "^(neovide)$"
    },
    opacity = "0.9 0.9"
}
hl.window_rule {
    match = {
        pin = true,
    },
    border_color = "rgb(61AFEF) rgb(E06C75)",
}
hl.window_rule {
    match = {
        class = "Rofi"
    },
    move = "5 35"
}
hl.window_rule {
    match = {
        class = ".*idea-ce match:title win.*"
    },
    no_focus = true,
}

hl.window_rule {
    match = {
        class = "mpv",
    },
    opacity = "1.0 override",
    keep_aspect_ratio = true,
}

--  See https://wiki.hypr.land/Configuring/Basics/Binds/ for more
local mainMod = "SUPER + "
--  Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
hl.bind(mainMod .. "Return", hl.dsp.exec_cmd("uwsm app -- alacritty"))
hl.bind(mainMod .. "SHIFT + C", hl.dsp.window.close())
hl.bind(mainMod .. "C", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mainMod .. "SHIFT + Q", hl.dsp.exit())
hl.bind(mainMod .. "Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. "P", hl.dsp.exec_cmd("~/.config/rofi/launchers/type-1/launcher.sh -run-command uwsm app -- {cmd}"))
hl.bind(mainMod .. "SHIFT + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. "M", hl.dsp.window.fullscreen())
hl.bind(mainMod .. "SHIFT + P", hl.dsp.window.pin({ action = "toggle" }))
-- hl.bind(mainMod .. "ALT + C", hl.dsp.exec_cmd("~/scripts/toggle_chat_transparency"))
--  Move focus with mainMod + arrow keys
hl.bind(mainMod .. "left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. "right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. "up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. "down", hl.dsp.focus({ direction = "d" }))

--  Switch workspaces with mainMod + [0-9]
local WORKSPACE_COUNT = 8
for i = 1, WORKSPACE_COUNT do
    hl.bind(mainMod .. i, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. "SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
    hl.bind(mainMod .. "ALT + " .. i, hl.dsp.workspace.move({ monitor = "+1" }))
end

hl.bind(mainMod .. "Tab", hl.dsp.focus({ workspace = "previous" }))
hl.bind(mainMod .. "Period", hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. "Comma", hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. "SHIFT + Period", hl.dsp.window.move({ workspace = "m+1" }))
hl.bind(mainMod .. "SHIFT + Comma", hl.dsp.window.move({ workspace = "m-1" }))
hl.bind(mainMod .. "SHIFT + S", exec_autostart)
--  Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. "mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. "mouse:274", hl.dsp.window.close())
--  bind =         , mouse:275, workspace, m-1
--  bind =         , mouse:276, workspace, m+1
hl.bind(mainMod .. "ALT + L", hl.dsp.window.resize({ x = 10,  y = 0,   relative = true }))
hl.bind(mainMod .. "ALT + H", hl.dsp.window.resize({ x = -10, y = 0,   relative = true }))
hl.bind(mainMod .. "ALT + K", hl.dsp.window.resize({ x = 0,   y = -10, relative = true }))
hl.bind(mainMod .. "ALT + J", hl.dsp.window.resize({ x = 0,   y = 10,  relative = true }))
hl.bind(mainMod .. "S", hl.dsp.window.toggle_swallow())
--  General keybinds
hl.bind("Print", hl.dsp.exec_cmd("flameshot gui"))
hl.bind("CONTROL + Print", hl.dsp.exec_cmd("grim -cg $(slurp -ro) - | wl-copy && notify-send Screenshot Screen copied to buffer"))
hl.bind("ALT + Print", hl.dsp.exec_cmd("grim -cg $(~/.config/hypr/selectwindow.sh) - | wl-copy && notify-send Screenshot Window copied to buffer"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("screencast.wayland"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pulsemixer --change-volume +5"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pulsemixer --change-volume -5"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pulsemixer --toggle-mute"))
hl.bind("XF86Tools", hl.dsp.exec_cmd("toggle-tui --option font.size=10 ncmpcpp"))
hl.bind("SHIFT + XF86Tools", hl.dsp.exec_cmd("toggle-window org.pulseaudio.pavucontrol"))
hl.bind("CONTROL + XF86Tools", hl.dsp.exec_cmd("toggle-tui --option font.size=10 btop"))
hl.bind("XF86Calculator", hl.dsp.exec_cmd("toggle-tui + calc -d"))
hl.bind(mainMod .. "E", hl.dsp.exec_cmd("emojis"))
hl.bind(mainMod .. "CONTROL + M", hl.dsp.exec_cmd("manpdf"))
--  Discord binds
-- hl.bind("CONTROL" .. "SHIFT" .. "D")
-- hl.bind("CONTROL" .. "SHIFT" .. "M")
--  Master layout
hl.bind(mainMod .. "SHIFT + Return", hl.dsp.layout("swapwithmaster"))
hl.bind(mainMod .. "J", hl.dsp.layout("cyclenext"))
hl.bind(mainMod .. "K", hl.dsp.layout("cycleprev"))
hl.bind(mainMod .. "SHIFT + J", hl.dsp.layout("swapnext"))
hl.bind(mainMod .. "SHIFT + K", hl.dsp.layout("swapprev"))
hl.bind(mainMod .. "I", hl.dsp.layout("addmaster"))
hl.bind(mainMod .. "D", hl.dsp.layout("removemaster"))
hl.bind(mainMod .. "N", hl.dsp.layout("focusmaster"))
hl.bind(mainMod .. "T", hl.dsp.layout("orientationleft"))
hl.bind(mainMod .. "Y", hl.dsp.layout("orientationtop"))

--  Two monitor setup bindings
hl.bind(mainMod .. "ALT + M", hl.dsp.workspace.swap_monitors({ monitor1 = "current", monitor2 = "+1" }))
hl.bind(mainMod .. "SHIFT + M", hl.dsp.workspace.move({ monitor = "+1" }))
hl.bind(mainMod .. "O", hl.dsp.focus({ monitor = "+1" }))
hl.env("WLR_DRM_NO_ATOMIC", "1")
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "MSTCRSR")
--  env = GTK_IM_MODULE, fcitx
--  env = QT_IM_MODULE, fcitx
hl.env("XMODIFIERS", "@im=fcitx")
hl.on("hyprland.start", function()
    hl.exec_cmd("flameshot")
end)

--  Autostart moved to systemd units (if apps are daemons)
--  and to autostart dirs by placing a desktop entry in ~/.config/autostart
