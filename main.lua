local anim8 = require 'anim8'
local util = require 'util'
local world = require 'ecs'

local input_system = require 'input_system'
local player_system = require 'player_system'
local movement_system = require 'movement_system'

local filter = util.filter
local map = util.map
local call = util.callIfCallable

local idle, run, idle_anim, run_anim


local render_system = {}
local animation_system = {}

function render_system_function(entities, dt)
	local create_layer_fitler = function(n)
		return function(e)
			if e.render_component.layer == n then
				return true
			else return false end
		end
	end
	local i = 1
	while true do
		layer=filter(create_layer_filter(i) , entities)
		if layers == nil then break end
		i=i+1

		for j, e in ipairs(layer) do
			
		end
	end
	return true
end


function animation_system_function(entities, dt)
	for i, e in ipairs(entities) do
		e.anim.active:update(dt)
	end
end

function love.load()
	idle = love.graphics.newImage("cinderella_idle.png")
	run = love.graphics.newImage("cinderella_run.png")

	local g_idle = anim8.newGrid(14, 33, idle:getWidth(), idle:getHeight())
	idle_anim = anim8.newAnimation(g_idle('1-7',1), 0.1)

	local g_run = anim8.newGrid(31, 31, run:getWidth(), run:getHeight())
	run_anim = anim8.newAnimation(g_run('1-8',1), 0.1)

	new_player = { player = {},
		       pos = {x=100, y=200},
		       velocity = 250,
		       dir={x=0, y=0},
		       player_control=player_system_component,
		       input = { valid = {}, entered = {}, command_map = {} ,
			state = {"S_IDLE"}}
		}
	new_player.anim = idle_anim
	new_player.img=idle


	world:add_entity(new_player)

	world:add_system(input_system)
	world:add_system(player_system )
	world:add_system(movement_system)
--	world:add_render_system(render_system)
end


function love.update(dt)
	world:update(dt)
end

function love.draw()
	world:render()
end
