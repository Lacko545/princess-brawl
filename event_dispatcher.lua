dispatcher = {}

local util = require 'util'
local filter = util.filter

dispatcher.subs = {}

function dispatecher:emit(event)
	if( subs[event.id] ~= nil ) then
		for i, entity in ipairs( subs[event.id] ) do 
			table.insert(entity.event_queue, event)
		end
	end
end

function dispatcher:subscribe(event, entity)
	table.insert(self.event_q[event], entity)
end

function dispatcher:unsubscribe(event, entity)
	table.remove(self.event_q[event], entity)
end

return dispatcher
