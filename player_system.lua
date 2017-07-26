sys = {}

function player_system_function(players, dt)
	local dir = {}
	dir.x = 0
	dir.y = 0
	
	for i, player in ipairs(players) do
	for j, button in ipairs(player.input.entered) do
		if button == 'left' then
			dir.x = dir.x - 1
		end
		if button == 'right' then
			dir.x = dir.x + 1
		end
		if button == 'up' then
			dir.y = dir.y - 1
		end
		if button =='down' then
			dir.y = dir.y + 1
		end
	end
	player.dir = dir
	end

end


sys.func = player_system_function
sys.name = "PLAYER_CONTROL_SYSTEM"
sys.filter_func = world.make_entity_filter("player")

return sys
