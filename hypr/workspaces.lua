
-------------------------------------
----- WINDOW RESIZE SUPPRESSIONS ----
-------------------------------------

local suppressMaximizeRule = hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

suppressMaximizeRule:set_enabled(true)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- expect 3 monitors, left, center, right
-- 10 on each

local function init(monitors)
    for i = 1, 10 do
        hl.workspace_rule({
            workspace = tostring(i + 10),
            monitor = monitors.left_name,
            persistent = true,
        })
        hl.workspace_rule({
            workspace = tostring(i),
            monitor = monitors.center_name,
            persistent = true,
        })
        hl.workspace_rule({
            workspace = tostring(i + 20),
            monitor = monitors.right_name,
            persistent = true,
        })
    end
end

return { init = init }

