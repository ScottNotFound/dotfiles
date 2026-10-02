---------------------
---- KEYBINDINGS ----
---------------------

local programs = require("programs")

local mod = "SUPER"

local function bind(keys, action, options)
	if type(keys) == "table" then
		keys = table.concat(keys, "+")
	end
	hl.bind(keys, action, options)
end

bind({ mod, "Return" }, hl.dsp.exec_cmd(programs.terminal), { description = "Open terminal" })
bind({ mod, "SPACE" }, hl.dsp.exec_cmd(programs.launcher), { description = "Open launcher" })
bind({ mod, "Q" }, hl.dsp.window.close(), { description = "Close current window" })
bind({ mod, "E" }, hl.dsp.exec_cmd(programs.file_manager), { description = "Open file manager" })
bind({ mod, "L" }, hl.dsp.exec_cmd(programs.locker), { description = "Lock screen" })
bind({ mod, "F" }, hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
bind({ mod, "P" }, hl.dsp.window.pseudo(), { description = "Pseudo-tile the window" })
bind({ mod, "J" }, hl.dsp.layout("togglesplit"), { description = "Toggle the split" })
bind({ mod, "SHIFT", "F" }, hl.dsp.window.fullscreen({ action = "toggle" }, { description = "Toggle fullscreen" }))

-- Move focus with mod + arrow keys
bind({ mod, "left" }, hl.dsp.focus({ direction = "left" }), { description = "Focus window left" })
bind({ mod, "right" }, hl.dsp.focus({ direction = "right" }), { description = "focus window right" })
bind({ mod, "up" }, hl.dsp.focus({ direction = "up" }), { description = "Focus window up" })
bind({ mod, "down" }, hl.dsp.focus({ direction = "down" }), { description = "Focus window down" })
-- shift to move window
bind({ mod, "SHIFT", "left" }, hl.dsp.window.move({ direction = "left" }), { description = "Focus window left" })
bind({ mod, "SHIFT", "right" }, hl.dsp.window.move({ direction = "right" }), { description = "focus window right" })
bind({ mod, "SHIFT", "up" }, hl.dsp.window.move({ direction = "up" }), { description = "Focus window up" })
bind({ mod, "SHIFT", "down" }, hl.dsp.window.move({ direction = "down" }), { description = "Focus window down" })

bind({ mod, "mouse:272" }, hl.dsp.window.drag(), {
	mouse = true,
	description = "Move window with mouse",
})

bind({ mod, "mouse:273" }, hl.dsp.window.resize(), {
	mouse = true,
	description = "Resize window with mouse",
})

-- cycle workspace
bind({ mod, "mouse_up" }, scene.cycle_scene_up, { description = "Next scene" })
bind({ mod, "mouse_down" }, scene.cycle_scene_down, { description = "Prev scene" })
bind({ mod, "CTRL", "mouse_up" }, scene.cycle_screen_up, { description = "Next workspace" })
bind({ mod, "CTRL", "mouse_down" }, scene.cycle_screen_down, { description = "Prev workspace" })
bind({ mod, "SHIFT", "mouse_up" }, scene.send_window_up, { description = "Move window to next workspace" })
bind({ mod, "SHIFT", "mouse_down" }, scene.send_window_down, { description = "Move window to prev workspace" })

bind({ mod, "tab" }, scene.cycle_scene_up, { description = "Next scene" })
bind({ mod, "SHIFT", "tab" }, scene.cycle_scene_down, { description = "Prev scene" })
bind({ mod, "CTRL", "tab" }, scene.cycle_screen_up, { description = "Next workspace" })
bind({ mod, "CTRL", "SHIFT", "tab" }, scene.cycle_screen_down, { description = "Prev workspace" })
bind({ "ALT", "tab" }, scene.cycle_screen_up, { description = "Next workspace" })
bind({ "ALT", "SHIFT", "tab" }, scene.cycle_screen_down, { description = "Prev workspace" })

bind({ mod, "page_up" }, scene.cycle_scene_up, { description = "Next scene" })
bind({ mod, "page_down" }, scene.cycle_scene_down, { description = "Prev scene" })
bind({ mod, "CTRL", "page_up" }, scene.cycle_screen_up, { description = "Next workspace" })
bind({ mod, "CTRL", "page_down" }, scene.cycle_screen_down, { description = "Prev workspace" })
bind({ mod, "SHIFT", "page_up" }, scene.send_window_up, { description = "Move window to next workspace" })
bind({ mod, "SHIFT", "page_down" }, scene.send_window_down, { description = "Move window to prev workspace" })

for i = 1, 10 do
	local n = i % 10

	bind({ mod, n }, function()
		scene.apply_scene(n)
	end, { description = "Switch to scene " .. n })

	bind({ mod, "CTRL", n }, function()
		scene.apply_screen(n)
	end, { description = "Switch to workspace on scene " .. n })

	bind({ mod, "SHIFT", n }, function()
		scene.send_window(n)
	end, { description = "Move window to scene " .. n })
end

bind({ mod, "R" }, scene.apply_current, { description = "Reapply current scene" })

local function finish(action)
	if type(action) == "function" then
		action()
	else
		hl.dispatch(action)
	end
	hl.dispatch(hl.dsp.submap("reset"))
end

bind({ mod, "ALT", "R" }, hl.dsp.submap("resize"))
hl.define_submap("resize", function()
	bind(
		{ "right" },
		hl.dsp.window.resize({ x = 50, y = 0, relative = true }),
		{ repeating = true, description = "Resize - grow x" }
	)
	bind(
		{ "left" },
		hl.dsp.window.resize({ x = -50, y = 0, relative = true }),
		{ repeating = true, description = "Resize - shrink x" }
	)
	bind(
		{ "up" },
		hl.dsp.window.resize({ x = 0, y = 50, relative = true }),
		{ repeating = true, description = "Resize - grow y" }
	)
	bind(
		{ "down" },
		hl.dsp.window.resize({ x = 0, y = -50, relative = true }),
		{ repeating = true, description = "Resize - shrink y" }
	)
	bind({ "escape" }, hl.dsp.submap("reset"))
end)

-- bind on trigger - tell ashell background to update
bind(
	{ "Caps_Lock" },
	hl.dsp.exec_cmd([[
kill -USR1 $(pgrep -f 'CAPSLOCK_GETTER_SCRIPT=1')
]]),
	{
		non_consuming = true,
		dont_inhibit = true,
		locked = true,
		ignore_mods = true,
		description = "Send capslock event to ashell script",
	}
)
-- bind on release - tell ashell background to update
bind(
	{ "Caps_Lock" },
	hl.dsp.exec_cmd([[
sleep 0.02; 
kill -USR1 $(pgrep -f 'CAPSLOCK_GETTER_SCRIPT=1')
sleep 0.02;
kill -USR1 $(pgrep -f 'CAPSLOCK_GETTER_SCRIPT=1')
]]),
	{
		release = true,
		non_consuming = true,
		dont_inhibit = true,
		locked = true,
		ignore_mods = true,
		description = "Send capslock event to ashell script",
	}
)

-- cycle layout
--hl.bind("SUPER + tab", function ()
--    local layouts   = { "scrolling", "dwindle", "master" }
--    local workspace = hl.get_active_workspace()
--    if hl.get_active_special_workspace() then
--        workspace = hl.get_active_special_workspace()
--    end
--
--    local next_layout = "dwindle"
--
--    if not workspace then
--        return
--    end
--
--    for i = 1, #layouts do
--        if layouts[i] == workspace.tiled_layout then
--            local next_layout_idx = (i % #layouts) + 1
--            next_layout = layouts[next_layout_idx]
--            break
--        end
--    end
--
--    if workspace.special then
--        hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout })
--    else
--        hl.workspace_rule({ workspace = "name:" .. tostring(workspace.name), layout = next_layout })
--    end
--end)

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), {
	locked = true,
	repeating = true,
	description = "Increase volume",
})

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), {
	locked = true,
	repeating = true,
	description = "Decrease volume",
})

bind({ mod, "V" }, hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), {
	locked = true,
	repeating = true,
	description = "Toggle audio mute",
})

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), {
	locked = true,
	repeating = true,
	description = "Toggle audio mute",
})

bind({ mod, "M" }, hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), {
	locked = true,
	repeating = true,
	description = "Toggle microphone mute",
})

hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), {
	locked = true,
	repeating = true,
	description = "Toggle microphone mute",
})

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), {
	locked = true,
	description = "Next track",
})

hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), {
	locked = true,
	description = "Play / pause",
})

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), {
	locked = true,
	description = "Play / pause",
})

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), {
	locked = true,
	description = "Previous track",
})
