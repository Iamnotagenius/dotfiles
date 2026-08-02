-- run example: hyprctl dispatch 'require("toggleable").toggle("pavucontrol", "pavucontrol")'
local M = {}

local pending = {}
local toggled = {}

hl.on("window.open", function (w)
    for tid in pairs(pending) do
        for _, tag in ipairs(w.tags) do
            if tag == ("toggle_%s*"):format(tid) then
                toggled[tid] = {
                    win = w,
                    rule = pending[tid]
                }
                pending[tid] = nil
                return
            end
        end
    end
end)

hl.on("window.destroy", function (w)
    for tid, win in pairs(toggled) do
        if win.win.address == w.address then
            if pending[tid] then
                pending[tid]:set_enabled(false)
                pending[tid] = nil
            end
            toggled[tid].rule:set_enabled(false)
            toggled[tid] = nil
        end
    end
end)

function M.toggle(tid, cmd)
    if pending[tid] then
        return hl.dsp.no_op()
    end

    if toggled[tid] then
        local win = toggled[tid]
        return (hl.dsp.window.close({ window = win.win }))
    end

    local rule = hl.window_rule {
        match = {
            tag = ("toggle_%s"):format(tid)
        },
        tag = "+toggleable",
    }

    pending[tid] = rule
    return (hl.dsp.exec_cmd(cmd, { tag = ("toggle_%s"):format(tid)}))
end

return M
