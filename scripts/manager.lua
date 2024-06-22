local manager = {}

manager.collision_group = -1
manager.ids = {}
manager.dragging = false
manager.cursor_pos = vmath.vector3()

function manager.select(aabb_id)
	for i=1, 200 do
		if aabb_id == manager.ids[i]["aabb_id"] then
			local id = manager.ids[i]["id"]
			msg.post(id, "select")
			break
		end
	end
	manager.dragging = true
end

function manager.deselect()
	for i=1, 200 do
		local id = manager.ids[i]["id"]
		msg.post(id, "deselect")
	end
	manager.dragging = false
end

return manager
