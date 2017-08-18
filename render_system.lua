local world = require 'ecs'
local util = require 'util'
local filter = util.filter
local map = util.map


local sys = {}

function render_system_function(entities)
	local create_layer_filter = function(n)
		return function(e)
			if e.graphics.layer == n then
				return true
			else return false end
		end
	end
	
	local sort_by_y = function(e1,e2)
		return e1.position.y < e2.position.y
	end

	local i = 1
	while true do
		if i > 4 then break end
		layers=filter(create_layer_filter(i) , entities)
		if layers ~= nil then 
			table.sort(layers, sort_by_y)

			for j, e in ipairs(layers) do
				e.graphics.active_image:draw(e.graphics.sprite_sheet,e.position.x, e.position.y)
			end
			i=i+1
		end
	end
	return true
end

sys.func = render_system_function
sys.name = 'render_system'
sys.filter_func = world.make_entity_filter("graphics", "position")

return sys
