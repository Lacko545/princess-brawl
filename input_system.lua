world = require("ecs")

sys = {}

function input_system_function(entities, dt)
	for i, ent in ipairs(entities) do
		ent.input.entered = {}
		for j, button in ipairs( ent.input ) do
			if love.keyboard.isDown( button ) then
				ent.input.entered.add(button)
			end
		end
	end

end

sys.func = input_system_function
sys.name = "INPUT_SYSTEM"
sys.filter_func = world.make_entity_filter("input")

return sys
