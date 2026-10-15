-- doubly linked ring list
-- operate only on nodes
-- no start, no end, cyclic
--
-- can create a ring with insert_after(nil, value)

local function insert_after(node, value)
	if node == nil then
		node = { value = value, next = nil, prev = nil }
		node.next = node
		node.prev = node
		return node
	end
	if node.prev == node and node.next == node then
		local other = { value = value, next = node, prev = node }
		node.next = other
		node.prev = other
		return other
	end
	local other = { value = value, next = node.next, prev = node }
	node.next.prev = other
	node.next = other
	return other
end

local function insert_before(node, value)
	if node == nil then
		node = { value = value, next = node, prev = node }
		return node
	end
	if node.prev == node and node.next == node then
		local other = { value = value, next = node, prev = node }
		node.next = other
		node.prev = other
		return other
	end
	local other = { value = value, next = node, prev = node.prev }
	node.prev.next = other
	node.prev = other
	return other
end

local function nillify_node(node)
	node.prev = nil
	node.next = nil
	node.value = nil
	node = nil
end

local function remove_node(node)
	if node == nil then
		-- no node
		return nil
	end
	if node.prev == node and node.next == node then
		-- node is only node, remove references
		nillify_node(node)
		return nil
	end
	if node.prev == node.next then
		-- two nodes, should self ref the other one
		local other = node.next
		other.next = other
		other.prev = other
		nillify_node(node)
		return other
	end
	local other = node.next
	node.prev.next = node.next
	node.next.prev = node.prev
	nillify_node(node)
	return other
end

local function rremove_node(node)
	if node == nil then
		-- no node
		return nil
	end
	if node.prev == node and node.next == node then
		-- node is only node, remove references
		nillify_node(node)
		return nil
	end
	if node.prev == node.next then
		-- two nodes, should self ref the other one
		local other = node.prev
		other.next = other
		other.prev = other
		nillify_node(node)
		return other
	end
	local other = node.prev
	node.prev.next = node.next
	node.next.prev = node.prev
	nillify_node(node)
	return other
end

local function next_node(node)
	if node == nil then
		return nil
	end
	return node.next
end

local function prev_node(node)
	if node == nil then
		return nil
	end
	return node.prev
end

local initial_scenes = {
	{
		name = "main",
		monitors = {
			A = {
				name = "HDMI-A-1",
				workspaces = { 1 },
				current = 1,
			},
			B = {
				name = "DP-1",
				workspaces = { 2 },
				current = 1,
			},
			C = {
				name = "DP-2",
				workspaces = { 3, 4, 5 },
				current = 1,
			},
		},
	},
	{
		name = "secondary",
		monitors = {
			A = {
				name = "HDMI-A-1",
				workspaces = { 6 },
				current = 1,
			},
			B = {
				name = "DP-1",
				workspaces = { 7 },
				current = 1,
			},
			C = {
				name = "DP-2",
				workspaces = { 8 },
				current = 1,
			},
		},
	},
}

local node = insert_after(nil, initial_scenes[1])
node = insert_after(node, initial_scenes[2])

local active_state = {
	active_scene_node = node,
	active_scene = node.value,
}

local function swap_to_scene(scene)
	active_state.active_scene = scene
	for monitor, mapping in ipairs(scene.monitors) do
		hl.dispatch(hl.dsp.workspace.move({ workspace = mapping.workspaces[mapping.current], monitor = mapping.name }))
		hl.dispatch(hl.dsp.focus({ workspace = mapping.workspaces[mapping.current] }))
		hl.workspace_rule({ workspace = mapping.workspaces[mapping.current], persistent = true, default = true })
	end
end

local function get_active_scene()
	return active_state.active_scene_node.value
end

local function setup_scene()
	local active = active_state.active_scene_node
	swap_to_scene(active.value)
	active = next_node(active)
	swap_to_scene(active.value)
end

-- setup_scene()
-- IGNORE ABOVE, NOT USED
--
--

-------------------------------------
---

-- index based scene mapping follows

local scene_index = 1

--local scene = {
--  left = scene_index,
--  center = scene_index,
--  right = scene_index,
--}

local function setup(config)
	local monitors = config.monitors
	local mon_names = { monitors.left_name, monitors.center_name, monitors.right_name }

	local function apply_scene(n)
		--scene = {left=n, center=n, right=n}
		local am = hl.get_active_monitor()
		scene_index = n
		for j = 0, 2 do
			local ws = n + 10 * j
			hl.dispatch(hl.dsp.focus({ workspace = tostring(ws) }))
		end
		hl.dispatch(hl.dsp.focus({ monitor = am }))
	end

	local function cycle_scene_up()
		scene_index = (scene_index % 10) + 1
		apply_scene(scene_index)
	end

	local function cycle_scene_down()
		scene_index = ((scene_index - 2) % 10) + 1
		apply_scene(scene_index)
	end

	local function borrow_workspace(n)
		hl.dispatch(hl.dsp.workspace.move({ workspace = tostring(n) }))
	end

	local function reset_scenespace()
		for i = 1, 10 do
			for j = 0, 2 do
				hl.workspace_rule({
					workspace = tostring(i + 10 * j),
					monitor = mon_names[j + 1],
					persistent = true,
				})
			end
		end
	end

	local function apply_current()
		apply_scene(scene_index)
	end

	local function return_borrowed()
		reset_scenespace()
		apply_current()
	end

	local function apply_screen(n)
		local aws = hl.get_active_workspace()
		local m = math.floor((aws.id - 1) / 10)
		local ws = n + 10 * m
		hl.dispatch(hl.dsp.focus({ workspace = tostring(ws) }))
	end

	local function cycle_screen_up()
		local aws = hl.get_active_workspace()
		local m = math.floor((aws.id - 1) / 10)
		local n = (aws.id % 10) + 1
		local ws = n + 10 * m
		hl.dispatch(hl.dsp.focus({ workspace = tostring(ws) }))
	end

	local function cycle_screen_down()
		local aws = hl.get_active_workspace()
		local m = math.floor((aws.id - 1) / 10)
		local n = ((aws.id - 2) % 10) + 1
		local ws = n + 10 * m
		hl.dispatch(hl.dsp.focus({ workspace = tostring(ws) }))
	end

	local function send_window(n)
		local aws = hl.get_active_workspace()
		local m = math.floor((aws.id - 1) / 10)
		local ws = n + 10 * m
		hl.dispatch(hl.dsp.window.move({ workspace = tostring(ws), follow = false }))
		hl.dispatch(hl.dsp.focus({ workspace = aws }))
	end

	local function send_window_up()
		local aws = hl.get_active_workspace()
		local m = math.floor((aws.id - 1) / 10)
		local n = (aws.id % 10) + 1
		local ws = n + 10 * m
		hl.dispatch(hl.dsp.window.move({ workspace = tostring(ws), follow = false }))
		hl.dispatch(hl.dsp.focus({ workspace = aws }))
	end

	local function send_window_down()
		local aws = hl.get_active_workspace()
		local m = math.floor((aws.id - 1) / 10)
		local n = ((aws.id - 2) % 10) + 1
		local ws = n + 10 * m
		hl.dispatch(hl.dsp.window.move({ workspace = tostring(ws), follow = false }))
		hl.dispatch(hl.dsp.focus({ workspace = aws }))
	end

	return {
		-- exports
		cycle_scene_up = cycle_scene_up,
		cycle_scene_down = cycle_scene_down,
		apply_scene = apply_scene,
		return_borrowed = return_borrowed,
		borrow_workspace = borrow_workspace,
		reset_scenespace = reset_scenespace,
		apply_current = apply_current,
		apply_screen = apply_screen,
		cycle_screen_up = cycle_screen_up,
		cycle_screen_down = cycle_screen_down,
		send_window = send_window,
		send_window_up = send_window_up,
		send_window_down = send_window_down,
	}
end

return {
	setup = setup,
}
