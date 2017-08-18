local world = require("ecs")

sys = {}

function input_system_function(entities, dt)
	for i, e in ipairs(entities) do
		e.input.entered = {}
		for j, button in ipairs( e.input.valid ) do
			if love.keyboard.isDown( button ) then
				table.insert(e.input.entered,button)
			end
		end
	end

end

sys.func = input_system_function
sys.name = "INPUT_SYSTEM"
sys.filter_func = world.make_entity_filter("input")

return sys
