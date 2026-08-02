hl.config {
    animations = {
        enabled = true
    }
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
