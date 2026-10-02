
------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- hl.monitor({
    -- output   = "",
    -- mode     = "preferred",
    -- position = "auto",
    -- scale    = "auto",
-- })

local left_monitor = hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@60",
    position = "0x-240",
    scale = 1,
    transform = 1,
})

local center_monitor = hl.monitor({
    output = "DP-1",
    mode = "3440x1440@164.90",
    position = "1080x0",
    scale = 1,
    transform = 0,
    bitdepth = 10,
    vrr = 3,
})

local right_monitor = hl.monitor({
    output = "DP-2",
    mode = "1920x1080@60",
    position = "4520x-240",
    scale = 1,
    transform = 1,
})

return {
    left = left_monitor,
    center = center_monitor,
    right = right_monitor,

    left_name = "HDMI-A-1",
    center_name = "DP-1",
    right_name = "DP-2",
}

