function love.load()
    bounce = love.audio.newSource("bounce.mp3", "static")
    score = love.audio.newSource("score.mp3", "static")
    wins = love.audio.newSource("wins.mp3", "static")
    love.window.setTitle("오량인의 성능 안 좋은 Pong - 2player Ver")
    love.window.setMode(640, 480)
    ball.x, ball.y = 320, 240
    ball.dx, ball.dy = 0, 0
    r, g, b, a = 1, 1, 1, 0.1
end
 
function reset()
    ball = { x = 320, y = 240, dx = math.random(-350, 350), dy = math.random(-350, 350) }
    paddle1 = { x = 20, y = 200, dy = 0, width = 10, height = 80 }
    paddle2 = { x = 610, y = 200, dy = 0, width = 10, height = 80 }
end

p1wins = ""
p2wins = ""
startmessege = "Press Enter(Return) to start"
score1 = 0
score2 = 0

reset()


function love.update(dt)
    if ball.dy ~= 0 then
        if ball.dx < 200 and ball.dx > -200 then
            reset()
        elseif ball.dy < 200 and ball.dy > -200 then
            reset()
        end
    end

    paddle1.y = paddle1.y + paddle1.dy * dt
    paddle2.y = paddle2.y + paddle2.dy * dt

    paddle1.y = math.max(0, math.min(paddle1.y, love.graphics.getHeight() - paddle1.height))
    paddle2.y = math.max(0, math.min(paddle2.y, love.graphics.getHeight() - paddle2.height))

    ball.x = ball.x + ball.dx * dt
    ball.y = ball.y + ball.dy * dt

    if ball.y < 0 or ball.y > love.graphics.getHeight() then
        ball.dy = -ball.dy
        love.audio.play(bounce)
    end

    if ball.x < 0 then
        score2 = score2 + 1
        love.audio.play(score)
        reset()
    elseif ball.x > love.graphics.getWidth() then
        score1 = score1 + 1
        love.audio.play(score)
        reset()
    end

    if ball.x < paddle1.x + paddle1.width and
        ball.y > paddle1.y and
        ball.y < paddle1.y + paddle1.height then
        ball.dx = -ball.dx
        love.audio.play(bounce)
    end
    if ball.x > paddle2.x - paddle2.width and
        ball.y > paddle2.y and
        ball.y < paddle2.y + paddle2.height then
        ball.dx = -ball.dx
        love.audio.play(bounce)
    end

    if score1 >= 3 then
        score1 = 255
        score2 = -255
        ball.x, ball.y = 320, 240
        paddle1.x, paddle1.y, paddle2.x, paddle2.y = 20, 200, 610, 200
        p1wins = "Player 1 Wins"
        if score1 == 11 then
            love.audio.play(wins)
        end
        r, g, b, a = 1, 1, 1, 0.1
        if love.keyboard.isDown("return") then
            score1 = 0
            score2 = 0
            p1wins = ""
            reset()
        end
    elseif score2 >= 3 then
        score1 = -255
        score2 = 255
        ball.x, ball.y = 320, 240
        paddle1.x, paddle1.y, paddle2.x, paddle2.y = 20, 200, 610, 200
        p2wins = "Player 2 Wins"
        if score2 == 11 then
            love.audio.play(wins)
        end
        r, g, b, a = 1, 1, 1, 0.1
        if love.keyboard.isDown("return") then
            score1 = 0
            score2 = 0
            p2wins = ""
            reset()
        end
    end
    if love.keyboard.isDown("return") then
        r, g, b, a = 1, 1, 1, 1
        if ball.x == 320 or ball.y == 240 then
            startmessege = ""
            reset()
        end
    end
end

function love.draw()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print(p1wins, 242, 260, 0, 2)
    love.graphics.print(p2wins, 242, 260, 0, 2)
    love.graphics.print(startmessege, 152, 260, 0, 2)

    love.graphics.setColor(r, g, b, a)
    love.graphics.circle("fill", ball.x, ball.y, 10)

    love.graphics.setColor(r, g, b, a)
    love.graphics.rectangle("fill", paddle1.x, paddle1.y, paddle1.width, paddle1.height)
    love.graphics.rectangle("fill", paddle2.x, paddle2.y, paddle2.width, paddle2.height)

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print(score1, 280, 10)
    love.graphics.print(score2, 340, 10)
end

function love.keypressed(key)
    if key == "w" then
        paddle1.dy = -450
    elseif key == "s" then
        paddle1.dy = 450
    end
    if key == "up" then
        paddle2.dy = -450
    elseif key == "down" then
        paddle2.dy = 450
    end
end
  
function love.keyreleased(key)
    if key == "w" or key == "s" then
        paddle1.dy = 0
    end
    if key == "up" or key == "down" then
        paddle2.dy = 0
        end
end