local anim8 = require 'anim8'
local world = require 'ecs'

local input_system     = require 'input_system'
local player_system    = require 'player_system'
local movement_system  = require 'movement_system'
local animation_system = require 'animation_system'
local render_system    = require 'render_system'


local idle, run, idle_anim, run_anim


function love.load()
	idle = love.graphics.newImage("assets/cinderella_idle.png")
	run = love.graphics.newImage("assets/cinderella_run.png")

	local g_idle = anim8.newGrid(14, 33, idle:getWidth(), idle:getHeight())
	idle_anim = anim8.newAnimation(g_idle('1-7',1), 0.1)

	local g_run = anim8.newGrid(31, 31, run:getWidth(), run:getHeight())
	run_anim = anim8.newAnimation(g_run('1-8',1), 0.1)

	new_player = { player = {},
		       graphics = {  layer= 2,
				     active_image = idle_anim,
				     sprite_sheet = idle },
		       position = {  x=100, 
			             y=200},
		       velocity =    250,
		       direction= {  x=0,
				     y=0},
		       input    = {  valid = {"up","down","left","right"},
				     entered = {},
				     command_map = {},
				     state = {"S_IDLE"}}
	}

	world:add_entity(new_player)

	world:add_system(input_system)
	world:add_system(player_system)
	world:add_system(movement_system)
	world:add_system(animation_system)
	world:add_render_system(render_system)
end


function love.update(dt)
	world:update(dt)
end

function love.draw()
	world:render()
end
