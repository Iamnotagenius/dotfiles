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

