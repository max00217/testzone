function love.load()
    love.graphics.setBackgroundColor(0.2, 0.2, 0.5)
    love.window.setTitle("오량인의 성능 안 좋은 Snake")
    love.window.setMode(640, 480)
    windowwidth = love.graphics.getWidth()
	windowheight = love.graphics.getHeight()
    snake = {
        {x = 10, y = 10},
        }
    speed = 0.3
    food = {
        x = windowwidth/2,--love.math.random(1, windowwidth),
        y = windowheight/2,--love.math.random(1, windowheight),
        size = 10
        }
    score = 0
    segmentsToAdd = 0
    DED = ""
    dirc = "up"
end

function drawsnake()
    for _,v in pairs(snake) do
        love.graphics.setColor(0, 255, 0)
        love.graphics.rectangle("fill", v.x * 10, v.y * 10, 10, 10)
    end
end

function drawapple()
    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle("fill", food.x, food.y, food.size, food.size)
end

function movesnake()
    dx, dy = 0, 0
    if DED ~= "ded" then
        if love.keyboard.isDown("up") then
            --dy = -speed
            dirc = "u"
        elseif love.keyboard.isDown("down") then
            --dy = speed
            dirc = "d"
        elseif love.keyboard.isDown("left") then
            --dx = -speed
            dirc = "l"
        elseif love.keyboard.isDown("right") then
            --dx = speed
            dirc = "r"
        end
        table.insert(snake, 1, { x = snake[1].x + dx, y = snake[1].y + dy })
        table.remove(snake)
    end
end

function snakedirc()
    if DED ~= "ded" then
        if dirc == "r" then
            snake[1].x = snake[1].x + 0.3
        elseif dirc == "l" then
            snake[1].x = snake[1].x - 0.3
        elseif dirc == "u" then
            snake[1].y = snake[1].y - 0.3
        elseif dirc == "d" then
            snake[1].y = snake[1].y + 0.3
        end
    end
end

function ded()
    if snake[1].x * 10 + 10 >= windowwidth or
    snake[1].x * 10 + 10 <= 0 or
    snake[1].y * 10 - 10 >= windowheight or
    snake[1].y * 10 - 10 <= 0 then
        DED = "ded"
    end
    for i = 15, #snake do
        if snake[1].x*10 + 10 > snake[i].x*10
        and snake[1].x*10 < snake[i].x*10 + 10
        and snake[1].y*10 + 10 > snake[i].y*10
        and snake[1].y*10 < snake[i].y*10 + 10 then
            DED = "ded"
        end
    end
end

function applespawn()
    food.x, food.y = food.x, food.y
end

function snakeeat()
    if snake[1].x*10 + 10 > food.x
    and snake[1].x*10 < food.x + food.size
    and snake[1].y*10 + 10 > food.y
    and snake[1].y*10 < food.y + food.size then
        score = score + 1
        food.x, food.y = love.math.random(10, windowwidth - 10), love.math.random(10, windowheight - 10)
        for i = 1, 3 do
            table.insert(snake, {x = snake[#snake].x, y = snake[#snake].y})
        end
    end
end

function love.update(dt)
    applespawn()
    snakeeat()
    movesnake()
    snakedirc()
    ded()
    for i = #snake, 1, -1 do
        if i == 1 then
            snake[i].x = snake[i].x + dx * speed
            snake[i].y = snake[i].y + dy * speed
        else
            snake[i].x = snake[i-1].x
            snake[i].y = snake[i-1].y
        end
    end


end

function love.draw()
    drawsnake()
    drawapple()

    love.graphics.print("score:".. score, 1, 1, 0, 1)
    love.graphics.print(DED, windowwidth/2 - 40, windowheight/2 - 30, 0, 3)
end