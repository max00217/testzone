platform = {}
player = {}
gamepad = {}

function love.load()
	camera = require 'libraries/camera'
	cam = camera()

	love.window.setMode(1400, 500)
	platform.width = love.graphics.getWidth()
	platform.height = love.graphics.getHeight()

	platform.x = 1

	platform.y = platform.height / 1

	player.x = love.graphics.getWidth() / 1.5 - 700
	player.y = love.graphics.getHeight() / 1.5
	gamepad.x = love.graphics.getWidth() / 1.5 + 100
	gamepad.y = love.graphics.getHeight() / 1.5

	player.speed = 300
	gamepad.speed = 300

	player.img = love.graphics.newImage("wasd.png")
	gamepad.img = love.graphics.newImage("xsx.png")

	player.ground = player.y + 80
	gamepad.ground = gamepad.y + 80
	
	player.y_velocity = 0
	gamepad.y_velocity = 0

	player.jump_height = -300
	gamepad.jump_height = -300
	player.gravity = -700
	gamepad.gravity = -700

	local joysticks = love.joystick.getJoysticks()
	joystick = joysticks[1]
end

function love.update(dt)
	if love.keyboard.isDown('d') then
		if player.x < (love.graphics.getWidth() - player.img:getWidth() + 280) then
			player.x = player.x + (player.speed * dt)
		end
	elseif love.keyboard.isDown('a') then
		if player.x > 0 then 
			player.x = player.x - (player.speed * dt)
		end
	end

	if love.keyboard.isDown('space') then
		if player.y_velocity == 0 then
			player.y_velocity = player.jump_height
		end
	end

	if player.y_velocity ~= 0 then
		player.y = player.y + player.y_velocity * dt
		player.y_velocity = player.y_velocity - player.gravity * dt
	end

	if player.y > player.ground then
		player.y_velocity = 0
    	player.y = player.ground
	end

	if not joystick then return end

	padrot = joystick:getGamepadAxis("leftx") * 360

    if joystick:getGamepadAxis("leftx") < 0 then
        if gamepad.x > 0 then
            gamepad.x = gamepad.x + (gamepad.speed * dt * joystick:getGamepadAxis("leftx"))
			love.graphics.draw(gamepad.img, gamepad.x, gamepad.y, padrot, 0.25, 0.25, 0, 32)
        end


    elseif joystick:getGamepadAxis("leftx") > 0 then
        if gamepad.x < (love.graphics.getWidth() - gamepad.img:getWidth() + 280) then
            gamepad.x = gamepad.x + (gamepad.speed * dt * joystick:getGamepadAxis("leftx"))
        end
    end

	if joystick:isDown(1) then
		if gamepad.y_velocity == 0 then
			gamepad.y_velocity = gamepad.jump_height
		end
	end

	if gamepad.y_velocity ~= 0 then
		gamepad.y = gamepad.y + gamepad.y_velocity * dt
		gamepad.y_velocity = gamepad.y_velocity - gamepad.gravity * dt
	end

	if gamepad.y > gamepad.ground then
		gamepad.y_velocity = 0
    	gamepad.y = gamepad.ground
	end
end

function love.draw()
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle('fill', platform.x, platform.y, platform.width, platform.height)

	cam:attach()
		love.graphics.draw(player.img, player.x, player.y, 0, 0.25, 0.25, 0, 32)
	cam:detach()	
	love.graphics.draw(gamepad.img, gamepad.x, gamepad.y, 0, 0.25, 0.25, 0, 32)

end