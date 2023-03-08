function love.load()
	local joysticks = love.joystick.getJoysticks()
	joystick = joysticks[1]

	leftCircle = {x = 200, y = 280, size = 50}
	rightCircle = {x = 600, y = 280, size = 50}
	speed = 300
end

function love.update(dt)
	if not joystick then return end

	leftCircle.x = leftCircle.x + dt*speed*joystick:getGamepadAxis("leftx")
	leftCircle.y = leftCircle.y + dt*speed*joystick:getGamepadAxis("lefty")
	
	rightCircle.x = rightCircle.x + dt*speed*joystick:getGamepadAxis("rightx")
	rightCircle.y = rightCircle.y + dt*speed*joystick:getGamepadAxis("righty")
end

function love.draw()
	local leftSize = (1-joystick:getGamepadAxis("triggerleft"))*leftCircle.size
	local rightSize = (1-joystick:getGamepadAxis("triggerright"))*rightCircle.size
	love.graphics.circle("fill", leftCircle.x, leftCircle.y, leftSize)
	love.graphics.circle("fill", rightCircle.x, rightCircle.y, rightSize)
end