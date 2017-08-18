local world = require 'ecs'

sys = {}

function player_system_function(players, dt)
	local direction = {}
	direction.x = 0
	direction.y = 0
	
	for i, player in ipairs(players) do
	for j, button in ipairs(player.input.entered) do
		if button == 'left' then
			direction.x = direction.x - 1
		end
		if button == 'right' then
			direction.x = direction.x + 1
		end
		if button == 'up' then
			direction.y = direction.y - 1
		end
		if button =='down' then
			direction.y = direction.y + 1
		end
	end
	player.direction = direction
	end

end


sys.func = player_system_function
sys.name = "PLAYER_CONTROL_SYSTEM"
sys.filter_func = world.make_entity_filter("player")

return sys
