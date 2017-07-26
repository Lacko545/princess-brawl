local util= require 'util'
local filter = util.filter
local map = util.map

local world = {}

world.entities = {}
world.systems = {}

function world:add_entity(e)
	table.insert(self.entities, e)
end

function world:add_system( sys )
	table.insert(self.systems, sys)
end

function world:add_render_system( r_sys )
	self.render_system = r_sys
end

function world:update(dt)
	local valid_entities
	for i, sys in ipairs( self.systems ) do
		valid_entities = filter( sys.filter_func, self.entities )
		sys.func(valid_entities, dt)
	end
end


function world:render()
	renderable_entities = filter( self.render_system.filter_func, self.entities )
	self.render_system.func( renderable_entities )
end

-- make_entity_filter("list", "of", "necessary", "components")
function world.make_entity_filter(...)
	local tmp = {...}
	-- filter_func(entity)
	return function( e )
		for i,req_comp in pairs(tmp) do
			local found = false
			for name, comp in pairs(e) do
				if req_comp == name then 
					found = true
					break
				end
			end
			
			if found == false then
				return false
			end
		end
		return true
	end

end

return world
