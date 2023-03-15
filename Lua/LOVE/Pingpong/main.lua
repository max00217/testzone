function love.load()
    bounce = love.audio.newSource("bounce.mp3", "static")
    padbounce = love.audio.newSource("padbounce.mp3", "static")
    p = {}
    love.window.setMode(500, 650)
    love.window.setTitle("오량인의 성능 안 좋은 Pong")

    x, y, r = 200, 200, 20
    vx, vy = 10.0, 10.0
    gravity = 0
    speed_scale = 70
    jump_speed = -10
    p.speed = 500
    p.x = 190
    vsync = true
    life = 5
    score = 0
    gameover = " "
    restart = " "

end

function love.update(dt)

    if x < r or x > love.graphics.getWidth() - 10 then
        vx = vx * -1
        love.audio.play(bounce)
    end
    if y > love.graphics.getHeight() then
        vy = jump_speed
        love.audio.play(bounce)

    elseif y < r then
        vy = -jump_speed / 2
        love.audio.play(bounce)
    end
    
    if love.keyboard.isDown('a') then
		if p.x > 0 then 
			p.x = p.x - (p.speed * dt)
		end
    end
    if love.keyboard.isDown('left') then
		if p.x > 0 then 
			p.x = p.x - (p.speed * dt)
		end
    end
    if love.keyboard.isDown('d') then
		if p.x < (love.graphics.getWidth() - 130) then
			p.x = p.x + (p.speed * dt)
        end
	end
    if love.keyboard.isDown('right') then
		if p.x < (love.graphics.getWidth() - 130) then
			p.x = p.x + (p.speed * dt)
        end
	end
    if x >= p.x then
        if x <= p.x + 120 then
            if y >= 530 then
                score = score + 1
                vy = jump_speed
                love.audio.play(padbounce)
            end
        end
    end
    
    x = x + vx * dt * speed_scale
    y = y + vy * dt * speed_scale
    vy = vy + gravity * dt

    if y > 550 then
        life = life - 1
        x, y, r = 200, 200, 20
        p.x = 190
    end
    
    if life == 0 then
        x, y, r = 200, 200, 0
        gameover = "Game Over"
        if r == 0 then
            p.x = 190
        end
        restart = "Press R to Restart."
        if love.keyboard.isDown("r") then
            life = 5
            score = 0
            x, y, r = 200, 200, 20
            p.x = 190
            gameover = " "
            restart = " "
        end
    end
end

function love.draw()
    
    love.graphics.print("Remaining Life : "..life, 140, 240, 0, 2)
    love.graphics.print("Score : "..score, 140, 200, 0, 2)
    love.graphics.print(gameover, 140, 300, 0, 2)
    love.graphics.print(restart, 140, 340, 0, 2)
    love.graphics.circle("fill", x, y, r)
    love.graphics.rectangle("fill", p.x, 550, 120, 10)
end

