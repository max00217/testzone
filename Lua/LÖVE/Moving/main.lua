kb = {}
gp = {}

function love.load()
    kb.x = love.graphics.getWidth() / 1.5
    kb.y = love.graphics.getHeight() / 1.5
    kb.speed = 300

	leftCircle = {"xsx", x = 200, y = 280, Rot = 0, size = 0.25}
	rightCircle = {"xsx", x = 600, y = 280, Rot = 0, size = 0.25}
	gp.speed = 300
    xsx = love.graphics.newImage("xsx.png")
    wasd = love.graphics.newImage("wasd.png")

    local joysticks = love.joystick.getJoysticks()
	joystick = joysticks[1]

end

function love.update(dt)

    if love.keyboard.isDown("w") then
        if kb.y > 0 then
            kb.y = kb.y - (kb.speed * dt)
        end
    end
    if love.keyboard.isDown('a') then
		if kb.x > 0 then 
			kb.x = kb.x - (kb.speed * dt)
		end
    end
    if love.keyboard.isDown("s") then
        if kb.y < 510 then
            kb.y = kb.y + (kb.speed * dt)
        end
    end
    if love.keyboard.isDown('d') then
		if kb.x < (love.graphics.getWidth() - wasd:getWidth() + 280) then
			kb.x = kb.x + (kb.speed * dt)
        end
	end

    if love.keyboard.isDown("lshift") then
        if love.keyboard.isDown("w") then
            if kb.y > 0 then
                kb.y = kb.y - (kb.speed * dt * 1.1) 
            end
        end
        if love.keyboard.isDown('a') then
            if kb.x > 0 then 
                kb.x = kb.x - (kb.speed * dt * 1.1)
            end
        end
        if love.keyboard.isDown("s") then
            if kb.y < 510 then
                kb.y = kb.y + (kb.speed * dt * 1.1)
            end
        end
        if love.keyboard.isDown('d') then
            if kb.x < (love.graphics.getWidth() - wasd:getWidth() + 280) then
                kb.x = kb.x + (kb.speed * dt * 1.1)
            end
        end
    end

    if love.keyboard.isDown("lctrl") then
        if love.keyboard.isDown("w") then
            if kb.y > 0 then
                kb.y = kb.y - (kb.speed * dt * -0.4) 
            end
        end 
        if love.keyboard.isDown('a') then
            if kb.x > 0 then 
                kb.x = kb.x - (kb.speed * dt * -0.4)
            end
        end   
        if love.keyboard.isDown("s") then
            if kb.y < (love.graphics.getWidth() - wasd:getWidth()) then
                kb.y = kb.y + (kb.speed * dt * -0.4)
            end
        end
        if love.keyboard.isDown('d') then
            if kb.x < (love.graphics.getWidth() - wasd:getWidth() + 280) then
                kb.x = kb.x + (kb.speed * dt * -0.4)
            end
        end
    end

    if not joystick then return end

    if joystick:getGamepadAxis("lefty") < 0 then
        if leftCircle.y > 0 then
            leftCircle.y = leftCircle.y + (gp.speed * dt * joystick:getGamepadAxis("lefty"))
        end

    elseif joystick:getGamepadAxis("lefty") > 0 then
        if leftCircle.y < (love.graphics.getWidth() - xsx:getWidth() + 80) then
            leftCircle.y = leftCircle.y + (gp.speed * dt * joystick:getGamepadAxis("lefty"))
        end
    end

    if joystick:getGamepadAxis("leftx") < 0 then
        if leftCircle.x > 0 then
            leftCircle.x = leftCircle.x + (gp.speed * dt * joystick:getGamepadAxis("leftx"))
        end

    elseif joystick:getGamepadAxis("leftx") > 0 then
        if leftCircle.x < (love.graphics.getWidth() - xsx:getWidth() + 280) then
            leftCircle.x = leftCircle.x + (gp.speed * dt * joystick:getGamepadAxis("leftx"))
        end
    end

    if joystick:isDown(9) then
        if joystick:getGamepadAxis("lefty") < 0 then
            if leftCircle.y > 0 then
                leftCircle.y = leftCircle.y + (gp.speed * dt * joystick:getGamepadAxis("lefty"))
            end
    
        elseif joystick:getGamepadAxis("lefty") > 0 then
            if leftCircle.y < (love.graphics.getWidth() - xsx:getWidth() + 80) then
                leftCircle.y = leftCircle.y + (gp.speed * dt * joystick:getGamepadAxis("lefty"))
            end
        end
    
        if joystick:getGamepadAxis("leftx") < 0 then
            if leftCircle.x > 0 then
                leftCircle.x = leftCircle.x + (gp.speed * dt * joystick:getGamepadAxis("leftx"))
            end
    
        elseif joystick:getGamepadAxis("leftx") > 0 then
            if leftCircle.x < (love.graphics.getWidth() - xsx:getWidth() + 280) then
                leftCircle.x = leftCircle.x + (gp.speed * dt * joystick:getGamepadAxis("leftx"))
            end
        end
    end
    if joystick:isDown(6) then
        if joystick:getGamepadAxis("lefty") < 0 then
            if leftCircle.y > 0 then
                leftCircle.y = leftCircle.y + (gp.speed * dt * joystick:getGamepadAxis("lefty"))
            end
    
        elseif joystick:getGamepadAxis("lefty") > 0 then
            if leftCircle.y < (love.graphics.getWidth() - xsx:getWidth() + 80) then
                leftCircle.y = leftCircle.y + (gp.speed * dt * joystick:getGamepadAxis("lefty"))
            end
        end
    
        if joystick:getGamepadAxis("leftx") < 0 then
            if leftCircle.x > 0 then
                leftCircle.x = leftCircle.x + (gp.speed * dt * joystick:getGamepadAxis("leftx"))
            end
    
        elseif joystick:getGamepadAxis("leftx") > 0 then
            if leftCircle.x < (love.graphics.getWidth() - xsx:getWidth() + 280) then
                leftCircle.x = leftCircle.x + (gp.speed * dt * joystick:getGamepadAxis("leftx"))
            end
        end
    end

	
	--[[rightCircle.x = rightCircle.x + dt*speed*joystick:getGamepadAxis("rightx")
	rightCircle.y = rightCircle.y + dt*speed*joystick:getGamepadAxis("righty")
    end
    if joystick:isDown(10) then
        rightCircle.x = rightCircle.x + dt*gp.speed*1.1*joystick:getGamepadAxis("rightx")
	    rightCircle.y = rightCircle.y + dt*gp.speed*1.1*joystick:getGamepadAxis("righty")
    end
    if joystick:isDown(6) then
        rightCircle.x = rightCircle.x + dt*gp.speed*1.1*joystick:getGamepadAxis("rightx")
	    rightCircle.y = rightCircle.y + dt*gp.speed*1.1*joystick:getGamepadAxis("righty")
    end]]
end

function love.draw()
    love.graphics.draw(wasd, kb.x, kb.y, 0, 0.25, 0.25, 0, 32) 
    --local leftSize = (1-joystick:getGamepadAxis("triggerleft"))*leftCircle.size
	--local rightSize = (1-joystick:getGamepadAxis("triggerright"))*rightCircle.size
	love.graphics.draw(xsx, leftCircle.x, leftCircle.y, 0, 0.25)
    --love.graphics.draw(xsx, rightCircle.x, rightCircle.y, 0, rightSize)
end