local world = require 'ecs'

local sys = {}

function animation_system_function(entities, dt)
	for i, e in ipairs(entities) do
		e.graphics.active_image:update(dt)
	end
end

sys.func = animation_system_function
sys.name = 'animation_system'
sys.filter_func = world.make_entity_filter("graphics")

return sys
