world = require 'ecs'

sys = {}

function movement_system_function(entities, dt)
	for i, e in ipairs(entities) do
		local direction = e.direction
		e.position.x = e.position.x + ( e.direction.x * e.velocity * dt )
		e.position.y = e.position.y + ( e.direction.y * e.velocity * dt )
	end
end

sys.func = movement_system_function
sys.name = "MOVEMENT_SYSTEM"
sys.filter_func = world.make_entity_filter("direction","velocity","position")

return sys
