sys = {}


function movement_system_function(entities, dt)
	for i, e in ipairs(entities) do
		local dir = e.dir
		e.pos.x = e.pos.x + ( e.dir.x * e.velocity * dt )
		e.pos.y = e.pos.y + ( e.dir.y * e.velocity * dt )
	end
end


sys.func = movement_system_function
sys.name = "MOVEMENT_SYSTEM"
sys.filter_func = world.make_entity_filter("dir","velocity","pos")

return sys
