function love.load()
    -- set initial position and size of the snake
    snake = {
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
        {x = 350, y = 350},
    }
    directions = {"up", "down", "left", "right"}

    direction = directions[love.math.random(1, #directions)]
    
    love.window.setMode(700, 700)
    windowwidth = love.graphics.getWidth()
	windowheight = love.graphics.getHeight()
    StartTimer = 0
end

function love.update(dt)
    StartTimer = StartTimer + dt
    timer = tonumber(string.format("%.0f", StartTimer))
    --next_time = next_time + min_dt

    -- randomly choose a new direction for the snake
    local new_direction = direction
    
        --while new_direction == direction do

    --while timer % 2 == 0 do
    if timer % 1 == 0 then
            new_direction = directions[love.math.random(1, #directions)]
        --end
    end
    direction = new_direction

    if snake[1].x >= windowwidth then
        direction = "left"
    elseif snake[1].x <= 0 then
        direction = "right"
    elseif snake[1].y >= windowheight then
        direction = "up"
    elseif snake[1].y <= 0 then
        direction = "down"
    end

    if direction == "up" then
        table.insert(snake, 1, {x = snake[1].x, y = snake[1].y - 5})
    elseif direction == "down" then
        table.insert(snake, 1, {x = snake[1].x, y = snake[1].y + 5})
    elseif direction == "left" then
        table.insert(snake, 1, {x = snake[1].x - 5, y = snake[1].y})
    elseif direction == "right" then
        table.insert(snake, 1, {x = snake[1].x + 5, y = snake[1].y})
    end
    table.remove(snake)
end

function love.draw()
    for i, segment in ipairs(snake) do
        love.graphics.rectangle("fill", segment.x, segment.y, 5, 5)
    end

    love.graphics.print(timer)
end
