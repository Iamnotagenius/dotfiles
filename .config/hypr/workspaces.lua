-- Workspace rules

local WORKSPACE_COUNT = 8
local mainMod = ("%s + "):format(require('common').mainMod)

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

hl.bind(mainMod .. "S", function ()
    local ws = hl.get_active_workspace()
    if not ws then
        return
    end
    local cmd = autostart[ws.name]
    if not cmd then
        return
    end
    hl.dispatch(hl.dsp.exec_cmd("uwsm app -- " .. autostart[ws.name]))
end)

for mon, workspaces in pairs(ws_by_monitor) do
    for _, ws in ipairs(workspaces) do
        hl.workspace_rule { monitor = mon, workspace = ws }
    end
end

for ws, cmd in pairs(autostart) do
    hl.workspace_rule { workspace = ws, on_created_empty = "uwsm app -- " .. cmd }
end

local function move_ws(ws)
    local ws = hl.get_workspace(ws)
    if not ws then
        return hl.dsp.no_op()
    end
    local all_mons = hl.get_monitors()
    for _, mon in ipairs(all_mons) do
        if mon.id ~= ws.monitor.id then
            return hl.dsp.workspace.move({ workspace = ws, monitor = mon })
        end
    end

    return hl.dsp.no_op()
end

--  Switch workspaces with mainMod + [0-9]
for i = 1, WORKSPACE_COUNT do
    hl.bind(mainMod .. i, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. "SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
    hl.bind(mainMod .. "ALT + " .. i, function ()
        hl.dispatch(move_ws(i))
    end)
end
