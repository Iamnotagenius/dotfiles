--  Please note not all available settings / options are set here.
--  For a full list, see the wiki
--  https://wiki.hyprland.org

require('monitors')
require('workspaces')
require('animations')
require('rules')
require('binds')

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
