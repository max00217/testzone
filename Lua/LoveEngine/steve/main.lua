local suit = require 'suit'

platform = {}
player = {}
cactus = {}

function love.load()
    jump = love.audio.newSource("jump.mp3", "static")
    count = love.audio.newSource("count.mp3", "static")

	love.window.setMode(700, 400)
    min_dt = 1/60
    next_time = love.timer.getTime()

	platform.width = love.graphics.getWidth() + 250
	platform.height = 20
	platform.x = 1
	platform.y = 265

	player.x = 62
	player.y = 265
    player.width = 15
    player.height = -45
    player.radian = -1.6
	player.ground = player.y
	player.y_velocity = 0
	player.jump_height = -430
	player.gravity = -1000

    cactus.x = 710
	cactus.y = 220
    cactus.width = 20
	cactus.height = 70
    cactus.spawn_timer = 0
    cactus.spawn_interval = 2

    IntroTimer = true
    StartTimer = 0

    acc = 0

    over = ""

    cooldown = 0.25

    steve = "Steve"

    move = 200

end

function overreset()
    over = ""
    steve = "Steve"
    cooldown = 0.25
    move = 200
    StartTimer = 0
    timer = string.format("%.3f", StartTimer)
    acc = 0
end


function reset()
    cactus.spawn_interval= love.math.random(1,2)*love.math.random(1,10)*cooldown
end

function love.update(dt)

    StartTimer = StartTimer + dt
    timer = string.format("%.3f", StartTimer)
    next_time = next_time + min_dt

    player.radian = -1.6
    player.x = 62
    player.width = 15
    player.height = -45
    
    if player.y == 250 then
        player.y = 265
    end


    if over == "" then
	    if love.keyboard.isDown('space') or love.keyboard.isDown('up') or love.keyboard.isDown('w') then
		    if player.y_velocity == 0 then
			    player.y_velocity = player.jump_height
                love.audio.play(jump)
		    end
	    end

        if love.keyboard.isDown('down') or love.keyboard.isDown('s') then
            player.radian = 0
            player.x = 50
            player.width = 45
            player.height = 15
            if player.y < 265 then
                player.y_velocity = -player.jump_height * 5
            end
            if player.y_velocity == 0 then
                player.radian = 0
                player.x = 50
                player.y = 250
            end
	    end
    elseif over == "Game Over" then
        if love.keyboard.isDown('space') or love.keyboard.isDown('up') or love.keyboard.isDown('w') then
        end
        if love.keyboard.isDown('down') or love.keyboard.isDown('s') then
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

    cactus.spawn_timer = cactus.spawn_timer + dt
    if cactus.spawn_timer > cactus.spawn_interval then
        cactus.spawn_timer = 0
        table.insert(cactus, {x = 710, y = 220})
        reset()
    end

    if timer % 10 == 0 then
        love.audio.play(count)
    end

    for i, cactus in ipairs(cactus) do
        if timer % 3 == 0 then
            acc = acc + 0.013
        end
        cactus.x = cactus.x - move * dt - acc
        if cactus.x < 0 then
            table.remove(cactus, i)
        end
        function CheckCollision(a, b)
            if b.y < a.y and
            a.x + 15 > b.x and a.x < b.x + 20 then
                return true
            else
                return false
            end
        end
        if CheckCollision(player, cactus) then
            over = "Game Over"
            cooldown = 0
            steve = "DED"
            cooldown = 0.25
            move = 0
            StartTimer = StartTimer - dt
            timer = string.format("%.3f", StartTimer)
            suit.layout:reset(love.graphics.getWidth() / 2 - 37.5, love.graphics.getHeight() / 2 - 15)
            button = suit.Button("Restart", suit.layout:row(75, 50))
            if button.hit then
                table.remove(cactus, i)
                overreset()
            end
        end
    end       
end

function love.draw()
    local cur_time = love.timer.getTime()
    if next_time <= cur_time then
       next_time = cur_time
       return
    end
    love.timer.sleep(next_time - cur_time)

	--love.graphics.rectangle('fill', platform.x, platform.y, platform.width, platform.height)
    love.graphics.print("groundgroundgroundgroundgroundgroundgroundgroundgroundgroundgroundgroundgroundgroundgroundgroundgroundgroundgroundgroundgroundgroundgroundgroundgroundground", platform.x, platform.y, 0)
    --love.graphics.rectangle('fill', player.x, player.y, player.width, player.height )
    love.graphics.print(steve, player.x, player.y, player.radian, 1.3)

    for i, cactus in ipairs(cactus) do
        love.graphics.print("Cactus", cactus.x, cactus.y+50, -1.6, 1.5)
        
    end
    love.graphics.rectangle('fill', cactus.x, cactus.y, cactus.width, cactus.height)

    love.graphics.printf(timer, 10, 10, 680, "right")

    love.graphics.print(over, 350, 200)
    suit.draw()
end